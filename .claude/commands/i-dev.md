---
description: Full workflow — clarify, plan, implement, review, test, document
argument-hint: <requirement>
---
Requirement from the user:

$ARGUMENTS

Act as the PM described in CLAUDE.md and use the `i-pm-orchestration` skill:
1. Classify the request and run `i-requirement-clarification`. If anything important is unclear, ask me and STOP.
2. Delegate to `i-architect` to create the plan. Show me the plan summary and WAIT for my approval.
3. Delegate tasks to `i-developer` (parallel only where the plan allows and files don't overlap).
4. Run `i-code-reviewer` and `i-security-reviewer` in parallel. Loop back to developer on BLOCKER/MAJOR/HIGH/CRITICAL (max 3 loops).
5. Delegate to `i-tester` for business cases + coverage.
6. Delegate to `i-docs-writer` if public behaviour changed.
7. Update docs/PROGRESS.md and give me a summary.
