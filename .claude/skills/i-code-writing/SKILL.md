---
name: i-code-writing
description: Standards for writing new production code — structure, naming, function grouping, error handling, and self-checks. Use whenever implementing a task, adding a feature, or writing any non-trivial code.
---

# Code Writing

## Structure
- Put code where the existing architecture says it belongs (see `i-codebase-reading`).
- **Group by responsibility/domain:** functions that change together live together. One module = one reason to change.
- Keep layers clean: handlers don't contain business logic; domain logic doesn't know about HTTP or SQL.
- Public surface small; keep helpers private to the module.

## Functions
- Do one thing; ideally < 40 lines; ≤ 3–4 parameters (use an options/struct object beyond that).
- Name by intent: `calculateInvoiceTotal`, not `doCalc`. Booleans read as questions: `isExpired`.
- Early return over deep nesting. No magic numbers — named constants.
- Pure where possible; push side effects (I/O, time, randomness) to the edges so it's testable.

## Errors & safety
- Validate input at boundaries. Never trust external data.
- Handle or propagate every error with context; never swallow silently.
- No secrets in code; read from config/env.
- Log useful context, never sensitive data (passwords, tokens, full card numbers, personal data).

## Before reporting done — self-check
- [ ] Matches the task's acceptance criteria exactly
- [ ] Follows `docs/CODING_STANDARDS.md` and existing conventions
- [ ] No duplicated logic; reused existing helpers
- [ ] Unit tests added/updated; build, lint, tests pass
- [ ] No debug prints, commented-out code, or unrelated changes
