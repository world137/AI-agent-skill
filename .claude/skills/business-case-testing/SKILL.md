---
name: business-case-testing
description: How to turn requirements, acceptance criteria, and business rules into Given/When/Then test scenarios that verify the software does what the business needs. Use when testing a feature from the user's/business perspective, writing acceptance tests, or checking that requirements are fully covered.
---

# Business Case Testing

## Process
1. List every **business rule** and **acceptance criterion** from the requirement and plan.
2. For each, write scenarios with `templates/scenario-matrix.md`:
   - Happy path
   - Alternative paths (different user roles, options)
   - Business-rule violations (what the business says should be rejected)
   - Business edge cases (end of month, timezone, currency rounding, quota reached, expired items)
3. **Expected results must come from the requirement or the user** — never invent them.
   Unclear → `NEEDS_INPUT` with the question.
4. Build a **traceability matrix**: requirement → scenarios → test names. Every requirement must
   map to at least one passing test.
5. Implement as acceptance/integration tests in the project's framework (Gherkin/BDD if the project uses it).

## Scenario format
```
Scenario: Member gets 10% discount on orders over 1,000 THB
  Given a logged-in member
  And a cart total of 1,200 THB
  When they check out
  Then the discount is 120 THB
  And the amount due is 1,080 THB
```
