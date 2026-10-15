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
│   │   ├── i-architect.md
│   │   ├── i-developer.md
│   │   ├── i-code-reviewer.md
│   │   ├── i-security-reviewer.md
│   │   ├── i-tester.md
│   │   ├── i-debugger.md         # (added beyond the request) finds the root cause of bugs
│   │   ├── i-docs-writer.md        # (added beyond the request) updates documentation
│   │   └── i-reverse-engineer.md   # analyses shipped binaries/packages/firmware (REA)
│   ├── skills/                   # specialized skills (SKILL.md + templates)
│   │   ├── i-pm-orchestration/
│   │   ├── i-requirement-clarification/
│   │   ├── i-architecture-design/
│   │   ├── i-implementation-planning/
│   │   ├── i-codebase-reading/
│   │   ├── i-code-writing/
│   │   ├── i-refactoring/
│   │   ├── i-code-review/
│   │   ├── i-security-audit/
│   │   ├── i-test-coverage/
│   │   ├── i-business-case-testing/
│   │   ├── i-debugging/
│   │   ├── i-documentation/
│   │   ├── i-cloudflare-security-audit/  # deep security audit (guidance + full audit mode)
│   │   └── i-reverse-engineer-anything/  # REA reverse-engineering workflows
│   └── commands/                 # slash commands: /i-dev /i-plan /i-review /i-test /i-fix /i-audit /i-reverse
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
| **PM** (main session in `CLAUDE.md`) | Analyzes requirements, asks the user, chooses agents, controls the workflow | i-pm-orchestration, i-requirement-clarification |
| **i-architect** | Designs the architecture and breaks tasks into a plan | i-architecture-design, i-implementation-planning, i-codebase-reading |
| **i-developer** | Reads code, writes code, structures code, refactors, groups functions | i-codebase-reading, i-code-writing, i-refactoring |
| **i-code-reviewer** | Code quality, maintainability, conformance to the plan | i-code-review |
| **i-security-reviewer** | OWASP, secrets, injection, auth, dependencies | i-security-audit, i-cloudflare-security-audit (guidance mode) |
| **i-tester** | Coverage cases + business cases | i-test-coverage, i-business-case-testing |
| **i-debugger** | Finds the root cause from errors/logs | i-debugging, i-codebase-reading |
| **i-docs-writer** | README, API docs, changelog | i-documentation |
| **i-reverse-engineer** | Explains shipped artifacts without source: binaries, APK/IPA, Electron, firmware, WASM, captures | i-reverse-engineer-anything, i-codebase-reading |

> **Why isn't the PM a sub-agent?** In Claude Code, a sub-agent can't call other sub-agents.
> The one that actually "delegates" work must therefore be the main session, so the PM role lives in `CLAUDE.md`.

## Install globally (this machine)

```bash
./scripts/install.sh      # symlink agents/commands/skills + global/CLAUDE.md into ~/.claude
```

- Every project can now use the agents, skills and `/i-dev /i-plan /i-review /i-test /i-fix /i-audit /i-reverse`.
- Symlinked: `git pull` in this repo updates everything; re-run `install.sh` only after adding new files.
- `global/CLAUDE.md` → `~/.claude/CLAUDE.md`: communication rules for all projects (ask when unsure, short and to the point).
- `i-init` (alias added to `~/.zshrc`): copy `CLAUDE.md` + `docs/` + `.claude/settings.json` into the current project (never overwrites).

## How to Use

1. Copy `CLAUDE.md`, `.claude/` and `docs/` to the root of your project.
2. Fill in the **Project-specific context** section in `CLAUDE.md` (language, test/lint commands).
3. Edit `docs/CODING_STANDARDS.md` to match your team, and change the hook in `.claude/settings.json` to use your formatter.
4. Open `claude` in the project, then use:
   - `/i-dev <requirement>` — full workflow (ask → plan → dev → review → test)
   - `/i-plan <requirement>` — have the architect plan only
   - `/i-review` — review changed code (quality + security)
   - `/i-test <scope>` — have the tester design and write tests
   - `/i-fix <bug>` — i-debugger → i-developer → regression test
   - `/i-audit [target] [output dir]` — full security audit run by the PM (`i-cloudflare-security-audit` full mode)
   - `/i-reverse <target> <question>` — reverse engineer a shipped artifact (needs the REA MCP server for full capability)

> The full audit runs in the main session, not in `i-security-reviewer`, because it delegates to
> hunter/verifier sub-agents and sub-agents cannot spawn sub-agents.

## The "Ask Before Acting" Rule

Every agent follows the same rule: if a requirement is unclear, missing information, or open to multiple interpretations → **stop and ask the user**
(see `.claude/skills/i-requirement-clarification/SKILL.md`). A sub-agent that runs into a question sends it back to the PM, who asks the user.
