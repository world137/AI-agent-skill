---
name: i-architecture-design
description: How to design software architecture for a feature or system — components, boundaries, data flow, interfaces, and trade-offs — and record decisions as ADRs. Use for any new feature, new module, integration, or structural change, before implementation starts.
---

# Architecture Design

## Process
1. **Understand constraints:** existing architecture (read the code), non-functional requirements, team conventions.
2. **Identify components:** each has one clear responsibility. Name them by domain, not by technology.
3. **Define boundaries & contracts:** public interfaces, function signatures, API endpoints
   (method, path, request, response, errors), events, DB schema changes.
4. **Data flow:** draw the main flow (Mermaid sequence or flowchart) including error paths.
5. **Consider ≥ 2 options** for any important decision; compare on simplicity, fit with existing code,
   performance, security, testability. Pick the simplest that meets the requirements.
6. **Record** significant decisions with `templates/adr.md` in `docs/adr/NNNN-<title>.md`.

## Principles
- Follow the existing architecture unless there is a strong reason not to (then write an ADR).
- Separation of concerns: transport (HTTP/CLI) → application/service → domain → infrastructure (DB, external APIs).
- Depend on interfaces at boundaries so things are testable.
- Design for testability and observability (logging, error codes) from the start.
- YAGNI: no abstractions for hypothetical future needs.

## Output (goes into the plan file)
- Context & goals
- Component diagram / list with responsibilities
- Interfaces & contracts
- Data model changes
- Sequence of the main flow
- Risks, trade-offs, rejected alternatives
