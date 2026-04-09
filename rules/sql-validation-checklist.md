---
created: 2026-04-09
updated: 2026-04-09
tags:
  - type/rule
  - sql
  - validation
  - dbt
aliases:
  - validation checklist
  - sql review
---

# SQL Validation Checklist

Reusable checklist for validating SQL queries, dbt models, and scorecards. Derived from real validation sessions on Mejuri's retail scorecard and OTIF pipeline.

---

## 1. Type safety

- [ ] Any `<=`, `>=`, `<`, `>` on a field that could be STRING must use `CAST(... AS INT64)` on both sides. Equality is safe with strings; range comparisons are not.
- [ ] Fiscal week numbers stored as strings will sort lexicographically ("9" > "10"). Always cast before comparing.

## 2. Join grain and fan-out

- [ ] When joining across multiple fiscal years on a week/period key, **always include year in the join condition**. Fiscal week 9 exists in FY2025 and FY2026 — joining on week alone doubles data.
- [ ] When a fact table has finer grain than a metric's natural grain (e.g., traffic per store-day spread across user_type rows), use `row_number()` or `CASE WHEN rn = 1` to assign the metric to exactly one row.
- [ ] After any JOIN, spot-check row counts. Silent fan-out produces no errors, just inflated numbers.

## 3. Hardcoded mappings vs. dimension tables

- [ ] Use the authoritative dimension field (e.g., `store_region` from `dim_store`) instead of hardcoded CTEs. Hardcoded lists drift as stores open/close.
- [ ] If a hardcoded roster CTE is used (e.g., store-to-MSL mapping), validate with a `LEFT JOIN` against the full population to find unmatched rows. `INNER JOIN` silently drops unmatched records.
- [ ] Always `TRIM()` string dimension fields when filtering or joining — trailing whitespace causes silent data loss.

## 4. LY (last year) comparisons

- [ ] Pre-computed `_ly` fields use comp-date mapping and spine-driven row creation. Querying "last year directly" is NOT equivalent — new stores, closed stores, and dimension changes cause systematic differences.
- [ ] Check whether dimension attributes (region, zone) are historicized (SCD Type 2) or snapshot-based. If snapshot-based, a store that changed region between years will attribute LY metrics to the current region.
- [ ] New stores near their opening date can have phantom LY metrics from pre-opening data sources (traffic sensors active before first transaction). The spine is transaction-driven, so sensor-only periods create asymmetry.

## 5. Partial periods

- [ ] Current (incomplete) week/month data compared against full LY periods produces misleading YoY numbers. Consider excluding the current period or flagging it as partial.

## 6. Data completeness

- [ ] Before adding multi-year support, validate that **all required metrics** (not just actuals) exist for each year. If targets only exist for the current year, %ASP metrics will be null for LY — nothing to divide by.
- [ ] `materialized='table'` rebuilds fully each run. If upstream data is removed for prior years, the table loses it permanently.

## 7. Window functions and date filters

- [ ] **Never filter dates inside a CTE that contains window functions.** `row_number() over (partition by ... order by ...)` recalculates over the filtered set. A row that should be `attempt_rn = 3` becomes `attempt_rn = 1` because earlier rows were excluded.
- [ ] Always filter after the window function, in the outer query.

```sql
-- WRONG
WITH base AS (
    SELECT ..., row_number() over (...) as rn
    FROM ...
    WHERE date(dt) = '2026-03-27'
)

-- RIGHT
WITH base AS (
    SELECT ..., row_number() over (...) as rn
    FROM ...
)
SELECT ... FROM base
WHERE date(dt) = '2026-03-27'
```

## 8. Multi-grain aggregation (week / month / quarter)

- [ ] For multi-grain scorecards, **re-aggregate at each grain level** from the same source, then `UNION ALL` with a `grain` column. Do not filter/group weekly output to get monthly — you get N rows per month instead of one.
- [ ] Each grain must have its own natural key: weekly = `reporting_week + yr`, monthly = `fiscal_period + yr`, quarterly = `fiscal_quarter + yr`. `reporting_week` is null for non-weekly grains — that's correct, not a bug.
- [ ] Under a 4-4-5 fiscal calendar, each week maps 1:1 to a period. `min(fiscal_period)` suffices — no need for majority-day logic.

## 9. Derived ratios

- [ ] For every derived ratio (CVR, AOV, SPV, %ASP), manually verify 3-5 cells against raw inputs. Even if inputs are correct, the formula can be wrong.
- [ ] Delta metrics must be in comparable units. `nmv_pct_asp - traffic_pct_asp` (percentage points) makes sense; `nmv_dollars - traffic_count` does not.
- [ ] Check `SAFE_DIVIDE` and `NULLIF` patterns for: NULL numerator, NULL denominator, zero denominator, negative values.

## 10. Exchange/return orders

- [ ] Exchange orders create dual analytics keys with different user_type classifications. Expect small discrepancies between raw transaction tables and spine-based models.
- [ ] Use the intermediate model (e.g., `xi_commercial_health`) as source of truth, not raw `xa_transaction_line`.

## 11. Validation methodology

- [ ] **Three-layer validation**: scorecard output → intermediate model → raw source. Full outer join at the store/entity level to bisect where discrepancies originate.
- [ ] **Additive identity checks**: children must sum to parent (Comp + NSO = Regional Total, East + West = Fleet Total). If they break, section-filter logic has a bug.
- [ ] **Note timestamps** of validation queries. If a discrepancy resolves unexpectedly, check whether the underlying model was rebuilt by a background `dbt run`.

## 12. Process

- [ ] Never remove features (header rows, sort orders, columns) the user didn't ask to change.
- [ ] When running validation across hours, underlying `materialized='table'` models may be rebuilt. Re-run the full validation suite after any rebuild.
