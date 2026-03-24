---
name: SQL comma style
description: Trailing commas in column lists, leading commas before CTE names
type: feedback
updated: 2026-03-24
---

- **Columns**: trailing commas (comma at end of line)
- **CTEs**: leading commas (comma before CTE name on same line)

Example:
```sql
with first_cte as (
    select
        id,
        name,
        created_at
    from table_a
)
, second_cte as (
    select
        id,
        value
    from table_b
)
select
    a.id,
    a.name,
    b.value
from first_cte a
left join second_cte b on a.id = b.id
```
