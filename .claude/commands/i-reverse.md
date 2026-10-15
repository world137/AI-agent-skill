---
description: Reverse engineer a shipped artifact (binary, package, APK, Electron app, firmware, capture)
argument-hint: <target path> <question>
---
Request: $ARGUMENTS

1. If the target path, the question, or my authorization to analyse the target is unclear, ask me and STOP.
2. Delegate to the `i-reverse-engineer` agent with a Task Brief (target, question, scope, report path).
3. If it reports REA tools/providers missing, show me its setup plan and wait for approval before any setup.
4. Summarise the findings with their evidence and the report path. If I want a reconstruction, route it
   through `i-architect` (plan) before any `i-developer` work.
