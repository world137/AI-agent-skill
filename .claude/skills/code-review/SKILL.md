---
name: code-review
description: Code review checklist and reporting format covering correctness, design, readability, structure, tests, and performance, with severity levels. Use whenever reviewing a diff, pull request, or newly written code.
---

# Code Review

## Order of review (most important first)
1. **Correctness** — does it do what the acceptance criteria say? Edge cases, null/empty, off-by-one, concurrency, error paths, transactions.
2. **Plan adherence** — matches the design/contracts; no scope creep; unplanned decisions explained.
3. **Design & structure** — right layer/module, single responsibility, functions grouped sensibly, no duplication, appropriate abstractions (not over-engineered).
4. **Readability** — naming, function size, comments explain *why*, consistent with codebase conventions.
5. **Tests** — meaningful assertions, cover the change, not brittle, no disabled tests.
6. **Performance** — N+1 queries, unnecessary loops/allocations, missing indexes, unbounded memory.
7. **Operability** — logging, error messages, config, backward compatibility, migrations reversible.

(Security is reviewed in depth by security-reviewer, but flag anything obvious.)

## Severity
- **BLOCKER** — wrong behaviour, data loss, breaks build/contract. Must fix.
- **MAJOR** — likely bug, maintainability problem, missing important test. Should fix before merge.
- **MINOR** — improvement worth doing.
- **NIT** — style/preference; optional.

## Report format
```
## Verdict: CHANGES_REQUESTED
| # | Severity | Location | Problem | Suggested fix |
|---|----------|----------|---------|---------------|
| 1 | BLOCKER | src/order/service.ts:42 | total ignores discount | apply discount before tax, see plan §5 |
## What's good
- ...
```
Be specific and kind. Every finding must be actionable.
