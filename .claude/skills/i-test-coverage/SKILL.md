---
name: i-test-coverage
description: How to design technical test cases that maximize meaningful coverage — branches, boundaries, equivalence classes, error paths, and integration points — and measure coverage. Use when writing or improving unit/integration tests or when checking that changed code is fully tested.
---

# Test Coverage

## Techniques
- **Equivalence partitioning:** one test per class of input (valid, invalid, empty).
- **Boundary values:** min-1, min, min+1, max-1, max, max+1; empty list, single item, many.
- **Branch coverage:** every `if/else`, `switch`, early return, and loop (0, 1, n iterations).
- **Error paths:** exceptions, external failures (DB down, timeout, 500), invalid state.
- **Null / undefined / zero / negative / unicode / very long strings.**
- **Concurrency/idempotency** where relevant (same request twice).

## Levels
- **Unit:** pure logic, mocks only at boundaries.
- **Integration:** real DB/test container or in-memory equivalent; verify contracts between components.
- **E2E/API:** happy path + critical business flows only (slow, keep few).

## Good tests
- Arrange–Act–Assert; one behaviour per test; name describes behaviour:
  `returns_zero_total_when_cart_is_empty`.
- Deterministic: control time, randomness, ordering.
- Assert outcomes, not implementation details.

## Coverage target
- Changed lines: aim ≥ 90% line, ≥ 80% branch (adjust in `docs/DEFINITION_OF_DONE.md`).
- Report uncovered lines and justify any that are intentionally untested.
