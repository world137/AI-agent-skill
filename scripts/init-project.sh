#!/usr/bin/env bash
# Copy the AI Dev Team project template (CLAUDE.md + docs/ + project settings) into a project.
# Usage: init-project.sh [target-dir]   (default: current directory). Never overwrites existing files.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
TARGET="$(cd "${1:-.}" && pwd)"
[ "$TARGET" = "$REPO" ] && { echo "target is the template repo itself"; exit 1; }

mkdir -p "$TARGET/.claude" "$TARGET/docs/plans" "$TARGET/docs/adr" "$TARGET/docs/handoffs" "$TARGET/docs/reports"
cp -n "$REPO/CLAUDE.md" "$TARGET/CLAUDE.md" || true
cp -n "$REPO/.claude/settings.json" "$TARGET/.claude/settings.json" || true
cp -Rn "$REPO/docs/" "$TARGET/docs/" || true

echo "Template added to $TARGET"
echo "Next: fill in 'Project-specific context' in CLAUDE.md and the formatter hook in .claude/settings.json"
