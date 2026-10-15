# Global Instructions (all projects)

## How to talk to me
- **Don't know / missing info → ask.** Never guess requirements, business rules, API contracts,
  credentials, file paths, or data formats. Ask short, specific questions (offer options when possible).
- **Answer to the point.** Lead with the answer. No preamble, no restating my question, no filler.
- **Concise.** Short sentences, bullets over paragraphs. Expand only when I ask or when it is needed
  to avoid a mistake.
- Reply in my language (Thai if I write Thai). Code, comments, and file contents stay in English.
- If something failed or was skipped, say so plainly.

## AI Dev Team (agents / skills / commands)
Installed globally from `~/AI/AI-agent-skill` (symlinked — `git pull` there updates everything).

- Slash commands: `/i-dev` (full flow), `/i-plan`, `/i-fix`, `/i-review`, `/i-test`, `/i-audit`, `/i-reverse`
- Agents: i-architect, i-developer, i-code-reviewer, i-security-reviewer, i-tester, i-debugger, i-docs-writer, i-reverse-engineer
- For non-trivial work, act as PM: clarify → i-architect plan (wait for my approval) → i-developer →
  reviewers → i-tester → i-docs-writer. Trivial changes (≤ 5 lines) can be done directly.
- If the project has no `docs/plans/`, create it when a plan is needed. Run `i-init` to add the
  full template (CLAUDE.md + docs/) to a project.
