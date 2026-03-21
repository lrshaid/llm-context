---
name: SQL comma style
description: When writing SQL CTEs, the comma separator goes before the CTE name on the same line (e.g. ", cte_name as (")
type: feedback
---

When writing SQL with multiple CTEs, place the comma before the CTE name on the same line, not after the closing parenthesis of the previous CTE.

Example:
```sql
with first_cte as (
    ...
)
, second_cte as (
    ...
)
```
