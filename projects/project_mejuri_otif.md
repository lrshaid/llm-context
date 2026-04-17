---
created: 2026-03-17
updated: 2026-03-17
tags:
  - type/project
  - mejuri
  - ops
  - pipeline
aliases:
  - otif
  - mejuri-otif
---

# OTIF -- On Time In Full

**Goal:** Measure how often Mejuri fails to deliver on time. "In Full" is implicit -- calculation is at line item level.

## Open decisions

- **Granularity:** Currently calculated at shipping level. Jenn (Senior Ops leader) requested line item level. To be defined in Wednesday 2026-03-18 meeting.
- **Planned date change window:** Current logic treats any planned date change within a 6-hour window as the same attempt, so expected replanning doesn't count as a delay.

## Related

Closely tied to [[mejuri-order-delays]] -- both deal with shipping date changes, different business need.

## Log

- **2026-03-17** -- Project documented. Waiting on Wednesday meeting to define line item vs shipping level.

See also: [[mejuri-order-delays]], [[mejuri-retail]]
