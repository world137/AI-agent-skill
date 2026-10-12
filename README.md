# AI Dev Team — Repo Template for Developing Code with AI Agents

A template for **Claude Code** that organizes AI into multiple agents. Each agent has its own skills,
and they work in sequence along one workflow: **receive requirement → plan/design → write code → review → test → document**.

## Structure

```
.
├── CLAUDE.md                     # Main rules + Project Manager (orchestrator) role + workflow
├── .claude/
│   ├── settings.json             # permissions + hooks (e.g. auto-format after file edits)
│   ├── agents/                   # sub-agents (each bound to its own skills)
│   │   ├── architect.md
│   │   ├── developer.md
│   │   ├── code-reviewer.md
│   │   ├── security-reviewer.md
│   │   ├── tester.md
│   │   ├── debugger.md           # (added beyond the request) finds the root cause of bugs
│   │   └── docs-writer.md        # (added beyond the request) updates documentation
│   ├── skills/                   # specialized skills (SKILL.md + templates)
│   │   ├── pm-orchestration/
│   │   ├── requirement-clarification/
│   │   ├── architecture-design/
│   │   ├── implementation-planning/
│   │   ├── codebase-reading/
│   │   ├── code-writing/
│   │   ├── refactoring/
│   │   ├── code-review/
│   │   ├── security-audit/
│   │   ├── test-coverage/
│   │   ├── business-case-testing/
│   │   ├── debugging/
│   │   └── documentation/
│   └── commands/                 # slash commands: /dev /plan /review /test /fix
└── docs/
    ├── plans/                    # Plan for each feature (single source of truth)
    ├── adr/                      # Architecture Decision Records
    ├── handoffs/                 # Handoff notes between agents
    ├── reports/                  # Review / security / test results
    ├── PROGRESS.md               # Overall work status (memory across sessions)
    ├── CODING_STANDARDS.md
    └── DEFINITION_OF_DONE.md
```

## Agents and Skills

| Agent | Responsibility | Skills |
|---|---|---|
| **PM** (main session in `CLAUDE.md`) | Analyzes requirements, asks the user, chooses agents, controls the workflow | pm-orchestration, requirement-clarification |
| **architect** | Designs the architecture and breaks tasks into a plan | architecture-design, implementation-planning, codebase-reading |
| **developer** | Reads code, writes code, structures code, refactors, groups functions | codebase-reading, code-writing, refactoring |
| **code-reviewer** | Code quality, maintainability, conformance to the plan | code-review |
| **security-reviewer** | OWASP, secrets, injection, auth, dependencies | security-audit |
| **tester** | Coverage cases + business cases | test-coverage, business-case-testing |
| **debugger** | Finds the root cause from errors/logs | debugging, codebase-reading |
| **docs-writer** | README, API docs, changelog | documentation |

> **Why isn't the PM a sub-agent?** In Claude Code, a sub-agent can't call other sub-agents.
> The one that actually "delegates" work must therefore be the main session, so the PM role lives in `CLAUDE.md`.

## How to Use

1. Copy `CLAUDE.md`, `.claude/` and `docs/` to the root of your project.
2. Fill in the **Project-specific context** section in `CLAUDE.md` (language, test/lint commands).
3. Edit `docs/CODING_STANDARDS.md` to match your team, and change the hook in `.claude/settings.json` to use your formatter.
4. Open `claude` in the project, then use:
   - `/dev <requirement>` — full workflow (ask → plan → dev → review → test)
   - `/plan <requirement>` — have the architect plan only
   - `/review` — review changed code (quality + security)
   - `/test <scope>` — have the tester design and write tests
   - `/fix <bug>` — debugger → developer → regression test

## The "Ask Before Acting" Rule

Every agent follows the same rule: if a requirement is unclear, missing information, or open to multiple interpretations → **stop and ask the user**
(see `.claude/skills/requirement-clarification/SKILL.md`). A sub-agent that runs into a question sends it back to the PM, who asks the user.
