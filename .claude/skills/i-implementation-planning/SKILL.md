---
name: i-implementation-planning
description: How to break a design into small, ordered, verifiable tasks with acceptance criteria and owners, written to docs/plans/. Use after the architecture is designed and before any code is written, so every agent works from the same plan.
---

# Implementation Planning

Use `templates/plan.md`. Save as `docs/plans/<NNN>-<slug>.md` (NNN = next number).

## Task rules
- Each task is completable and reviewable on its own (ideally < ~300 lines changed).
- Each task has: ID (T1, T2…), owner agent, files, dependencies, acceptance criteria (checkable).
- Order tasks so the code stays buildable after each one. Contracts/interfaces and data model first,
  then core logic, then wiring/UI, then docs.
- Mark tasks that can run in parallel.
- Include test tasks explicitly (business cases + coverage), not just "add tests".
- List assumptions and open questions at the top; the plan is not `APPROVED` while questions remain.

## Plan status lifecycle
`DRAFT` → `APPROVED` (by user) → `IN_PROGRESS` → `DONE`
Any agent that needs to change the plan sets it back to `DRAFT`, describes the change in the
Change Log, and the PM asks the user again.
