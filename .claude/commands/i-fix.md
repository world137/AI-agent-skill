---
description: Bug fix workflow — debug, fix, regression test, review
argument-hint: <bug description / error>
---
Bug: $ARGUMENTS

1. Delegate to `i-debugger` to reproduce and find the root cause. If it can't reproduce, ask me for details.
2. Delegate the fix to `i-developer` with the debugger's findings.
3. Delegate to `i-tester` to add a regression test that fails before and passes after.
4. Delegate to `i-code-reviewer`. Summarise root cause, fix, and test to me.
