---
name: i-pm-orchestration
description: How the Project Manager classifies a user request, chooses which agents to call and in what order, writes Task Briefs, and tracks progress. Use at the start of every user request and whenever deciding the next step in the workflow.
---

# PM Orchestration

## Step 1 — Classify the request
Decide one: `feature`, `bug`, `refactor`, `question`, `security`, `tests`, `docs`, `unclear`.
Also estimate size: `trivial` (≤ 5 lines, no design impact), `small` (1 module), `large` (multiple modules / new architecture).

## Step 2 — Check understanding
Run the `i-requirement-clarification` checklist. If any item is unknown and matters for the result,
ask the user now (max 5 questions, grouped, each with a suggested default). Wait for answers.

## Step 3 — Pick the route
Use the routing table in `CLAUDE.md`. Rules:
- `large` → always architect first, then user approval.
- `small` feature → i-architect writes a short plan (can be 1 page).
- `trivial` → i-developer directly, still reviewed.
- Reviewers (code + security) may run **in parallel**. Developer tasks with no dependency between
  them may also run in parallel, but never two agents editing the same file at once.

## Step 4 — Delegate with a Task Brief
Use `templates/task-brief.md`. A sub-agent only knows what you give it — always include the plan path.

## Step 5 — Handle the result
| Agent status | Action |
|---|---|
| `NEEDS_INPUT` / `QUESTIONS` | Forward the questions to the user. Do not answer on the user's behalf unless it is in the plan/docs. |
| `CHANGES_REQUESTED` / `FAIL` | Send findings back to developer. Count loops. After 3 loops → ask the user. |
| `DONE` / `APPROVE` / `PASS` | Move to the next step. |

## Step 6 — Close out
- Update `docs/PROGRESS.md` (what was done, plan id, open items).
- Summarise to the user: what changed, how to verify, open risks, next suggestions.
