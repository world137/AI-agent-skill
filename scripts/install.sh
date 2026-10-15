#!/usr/bin/env bash
# Install this repo's agents, commands, skills and global CLAUDE.md into ~/.claude as symlinks,
# so every project on this machine can use them and `git pull` updates them in place.
set -euo pipefail

REPO="$(cd "$(dirname "$0")/.." && pwd)"
DEST="$HOME/.claude"
BACKUP="$DEST/backups/ai-agent-skill-$(date +%Y%m%d-%H%M%S)"

link() { # link <source> <target>
  local src="$1" dst="$2"
  if [ -L "$dst" ]; then
    rm "$dst"
  elif [ -e "$dst" ]; then
    mkdir -p "$BACKUP/$(dirname "${dst#$DEST/}")"
    mv "$dst" "$BACKUP/${dst#$DEST/}"
  fi
  ln -s "$src" "$dst"
  echo "linked ${dst#$HOME/}"
}

mkdir -p "$DEST/agents" "$DEST/commands" "$DEST/skills"

# Remove links into this repo whose source no longer exists (e.g. after a rename).
for l in "$DEST"/agents/* "$DEST"/commands/* "$DEST"/skills/*; do
  [ -L "$l" ] && [ ! -e "$l" ] && [[ "$(readlink "$l")" == "$REPO"/* ]] && rm "$l" && echo "removed stale ${l#$HOME/}"
done

for f in "$REPO"/.claude/agents/*.md;   do link "$f" "$DEST/agents/$(basename "$f")"; done
for f in "$REPO"/.claude/commands/*.md; do link "$f" "$DEST/commands/$(basename "$f")"; done
for d in "$REPO"/.claude/skills/*/;     do d="${d%/}"; link "$d" "$DEST/skills/$(basename "$d")"; done
link "$REPO/global/CLAUDE.md" "$DEST/CLAUDE.md"

# Clean up loose files from an earlier flattened copy (they belong inside skill folders).
for f in "$DEST"/skills/*.md "$DEST"/skills/*.cjs "$DEST"/skills/*.json "$DEST/skills/references" "$DEST/skills/templates"; do
  [ -e "$f" ] && [ ! -L "$f" ] || continue
  mkdir -p "$BACKUP/skills-stray"; mv "$f" "$BACKUP/skills-stray/"; echo "moved stray ${f#$HOME/}"
done

# `i-init` alias: copy the project template (CLAUDE.md + docs/) into the current directory.
RC="$HOME/.zshrc"
if ! grep -q "alias i-init=" "$RC" 2>/dev/null; then
  [ -s "$RC" ] && [ -n "$(tail -c1 "$RC")" ] && echo >> "$RC"   # ensure trailing newline
  echo "alias i-init='$REPO/scripts/init-project.sh'" >> "$RC"
  echo "added i-init alias to $RC"
fi

[ -d "$BACKUP" ] && echo "backups: $BACKUP"
echo "done."
