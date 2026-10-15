---
description: Full security audit / pen test of the codebase (i-cloudflare-security-audit full mode)
argument-hint: [target path, default repo root] [output dir]
---
Target: ${ARGUMENTS:-the repository root}

Act as the PM described in CLAUDE.md. Run the `i-cloudflare-security-audit` skill in **full audit mode**
from this main session (it delegates to hunter/verifier sub-agents, which a sub-agent cannot do).

1. Confirm with me: the target, the output directory (default `~/security-audit-skill/<repo-name>/run-<N>`,
   outside the repo), and that the execution sandbox controls the skill requires are available.
   If the sandbox cannot be enforced, do source-only analysis — never run target code.
2. Follow all six phases in order. Never probe live/deployed endpoints. Do not modify target source.
3. Finish only in one of the skill's two terminal states (validators pass, or `run_status: "incomplete"` with reason).
4. Give me a summary ordered by severity, plus the report path. Offer to route confirmed findings to
   `i-developer` → `i-security-reviewer` as fix tasks. Update docs/PROGRESS.md.
