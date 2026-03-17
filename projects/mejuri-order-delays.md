---
name: Order Delays
type: project
description: Mejuri Ops — automate delay communication to CX, replacing manual spreadsheet from Fufil ERP
---

# Order Delays

**Goal:** Automate how Ops communicates package delays to CX so they can proactively notify customers.

## Current state

- Ops team manually pulls a spreadsheet from Fufil (ERP) to inform CX of delays. Error-prone and manual.
- Pipeline rule: only reports delays when planned date shifts by 7+ days → Lautaro's proposed fix: report any order with more than one planned ship date, adjust rules later if noisy.

## Status

- Meeting with Kristy and Jenn happened — Lautaro couldn't attend due to EMV incident. Need to follow up on what was decided.
- Related to OTIF project.

## Next steps

- Follow up with Kristy/Jenn on meeting outcomes.
- Define the delay reporting threshold (7-day rule vs. any change).
