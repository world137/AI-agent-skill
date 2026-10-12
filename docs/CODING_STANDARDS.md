# Coding Standards

> Edit this file for your team. All agents follow it.

## General
- Language/framework version: TODO
- Formatter / linter: TODO (must pass in CI)
- Folder structure: TODO (e.g. feature-based `src/<domain>/{handler,service,repository}`)

## Naming
- Files: TODO (kebab-case / snake_case)
- Functions: verbs describing intent; booleans `is/has/can`
- No abbreviations except well-known ones (id, url, http)

## Functions & modules
- Function ≤ ~40 lines, ≤ 4 parameters
- Group functions by domain; avoid generic `utils`
- No business logic in handlers/controllers

## Errors & logging
- Wrap errors with context; never swallow
- Structured logging; no secrets/PII

## Tests
- Test file location & naming: TODO
- Each public function has tests; each bug fix has a regression test

## Git
- Conventional Commits (`feat:`, `fix:`, `refactor:`, `test:`, `docs:`)
- One logical change per commit; refactors separate from features
