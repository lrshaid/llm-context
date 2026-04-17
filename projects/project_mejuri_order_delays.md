---
created: 2026-03-17
updated: 2026-03-17
tags:
  - type/project
  - mejuri
  - ops
  - pipeline
aliases:
  - order delays
  - mejuri-order-delays
---

# Order Delays

**Goal:** Automate how Ops communicates package delays to CX so they can proactively notify customers.

## Current state

- Ops team manually pulls a spreadsheet from Fufil (ERP) to inform CX of delays. Error-prone and manual.
- Pipeline rule: only reports delays when planned date shifts by 7+ days. Lautaro's proposed fix: report any order with more than one planned ship date, adjust rules later if noisy.

## Status

- Meeting with Kristy and Jenn happened -- Lautaro couldn't attend due to EMV incident. Need to follow up on what was decided.
- Related to [[mejuri-otif]].

## Next steps

- Follow up with Kristy/Jenn on meeting outcomes.
- Define the delay reporting threshold (7-day rule vs. any change).

## Log

- **2026-03-13** -- EMV incident: pipeline partition issue caused exchanges to miss reclassification. Fixed with daily full refresh + partition fix.
- **2026-03-14** -- EMV confirmed resolved (36k, in line with previous days).
- **2026-03-16** -- Proposed to Jenn: report any order with >1 planned ship date, adjust rules later.
- **2026-03-17** -- Project documented. Need to follow up on missed meeting with Kristy/Jenn.

See also: [[mejuri-otif]], [[mejuri-retail]]
