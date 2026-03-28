---
name: Stack Overflow BigQuery Analysis
description: SQL analysis project querying bigquery-public-data.stackoverflow — tag performance, python vs dbt YoY, post quality correlations
type: project
created: 2026-03-24
---

Built a set of BigQuery queries analyzing Stack Overflow data (bigquery-public-data.stackoverflow). Published to https://github.com/lrshaid/stackoverflow-bigquery-analysis

Three questions, four queries:
- **Q1 Part 1**: Top/bottom 20 individual tags by avg answers (p90 threshold = 75+ questions)
- **Q1 Part 2**: Top/bottom 20 tag pairs — self-cross join with deduplication (`t1 < t2`)
- **Q2**: Python vs dbt YoY answer rate and accepted rate (regex for exact tag matching, `lag()` for YoY)
- **Q3**: Post quality correlations — 7 features (title length, body length, code presence, tag count, hour, day of week, author reputation) bucketed via `union all`

Key finding from Q3: shorter title + shorter body = higher accepted rate. Author reputation showed poor correlation.

Also connected to BigQuery CLI (`bq` via gcloud, authenticated as lautarorshaid@gmail.com, project: triple-acre-469215-p0).
