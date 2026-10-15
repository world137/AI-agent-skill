---
name: i-refactoring
description: Safe refactoring techniques — extracting and grouping functions, splitting large files, removing duplication, improving names — without changing behaviour. Use when code is hard to read, duplicated, too long, poorly grouped, or when the plan includes a cleanup task.
---

# Refactoring

## Golden rule
Refactoring changes **structure, not behaviour**. Tests must be green before and after each step.
If there are no tests around the code, write characterization tests first (or ask the PM to route to the tester).

## Process
1. Identify the smell (list below) and write down the target structure.
2. Make one small transformation at a time; run tests after each.
3. Keep refactor commits separate from feature/bug commits.
4. Stay within the scope in the Task Brief. Report other smells instead of fixing them.

## Smells → techniques
| Smell | Technique |
|---|---|
| Long function | Extract function; name each step |
| Duplicate code | Extract shared function/module; parameterize differences |
| God file / class | Split by responsibility; group related functions into modules |
| Long parameter list | Introduce parameter object |
| Deep nesting | Guard clauses / early return; extract branches |
| Feature envy (uses another module's data heavily) | Move function to that module |
| Primitive obsession | Introduce small value types |
| Switch on type everywhere | Polymorphism / strategy map |
| Unclear names | Rename (use the tool/IDE-wide rename, update all references) |
| Dead code | Delete (confirm with Grep it's unused, incl. reflection/config) |

## Grouping functions — checklist
- Functions that share data or always change together → same module.
- Name the module after the domain concept (`invoice/`, `pricing/`), not `utils`/`helpers`.
- A `utils` file > ~200 lines is a sign it should be split by domain.
