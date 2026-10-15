---
name: i-codebase-reading
description: Systematic way to read and understand an existing codebase — structure, conventions, entry points, dependencies, and where a change belongs. Use before modifying code, before designing in an existing project, or when the user asks how something works.
---

# Codebase Reading

## Fast map (do this first)
1. Root files: README, package manifest (package.json / go.mod / pyproject.toml / pom.xml), Makefile, CI config.
2. Directory tree 2–3 levels deep (`Glob`), identify layers (handlers/controllers, services, domain, repositories, utils, tests).
3. Entry points: main, router, CLI commands, job/consumer registration.
4. Test layout and test helpers.

## Targeted reading
- Find the symbol (`Grep`) → read its definition → read 2–3 call sites → read its tests.
- Follow the data: where it enters, how it is validated, transformed, stored, returned.
- Note conventions: naming, error handling style, logging, dependency injection, folder per feature vs per layer.
- Look for an existing helper before writing a new one.

## Output (when asked to explain or before planning)
- Short structure map (layer → folders)
- The flow relevant to the task (file:function chain)
- Conventions to follow
- Smells / risks noticed (duplicate logic, god files, missing tests) — report, don't fix unless in scope
