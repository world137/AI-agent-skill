---
description: Bug fix workflow — debug, fix, regression test, review
argument-hint: <bug description / error>
---
Bug: $ARGUMENTS

1. Delegate to `debugger` to reproduce and find the root cause. If it can't reproduce, ask me for details.
2. Delegate the fix to `developer` with the debugger's findings.
3. Delegate to `tester` to add a regression test that fails before and passes after.
4. Delegate to `code-reviewer`. Summarise root cause, fix, and test to me.
