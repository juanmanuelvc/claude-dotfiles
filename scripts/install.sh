#!/usr/bin/env bash
# install.sh — install portable skills/prompts for Cursor, Codex, Pi, and peers
# Primary target: ~/.agents/ (Agent Skills standard — read by Cursor and Pi)
# Adapters: ~/.codex/skills, ~/.cursor/commands (prompts)
# Run: bash scripts/install.sh
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
AGENTS_HOME="${AGENTS_HOME:-$HOME/.agents}"
CODEX_HOME="${CODEX_HOME:-$HOME/.codex}"
CURSOR_HOME="${CURSOR_HOME:-$HOME/.cursor}"

echo "Installing agent-skills from $DOTFILES_DIR"

mkdir -p "$AGENTS_HOME/skills" "$AGENTS_HOME/prompts" "$AGENTS_HOME/templates"
mkdir -p "$CODEX_HOME/skills"
mkdir -p "$CURSOR_HOME/commands"

link() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    mv "$dst" "$dst.bak"
    echo "  BACK $dst -> $dst.bak"
  fi
  ln -sfn "$src" "$dst"
  echo "  LINK $dst -> $src"
}

# --- Portable core → ~/.agents ---
for skill_dir in "$DOTFILES_DIR"/skills/*/; do
  [[ -d "$skill_dir" ]] || continue
  name="$(basename "$skill_dir")"
  link "$skill_dir" "$AGENTS_HOME/skills/$name"
done

for prompt in "$DOTFILES_DIR"/prompts/*.md; do
  [[ -f "$prompt" ]] || continue
  name="$(basename "$prompt")"
  link "$prompt" "$AGENTS_HOME/prompts/$name"
done

link "$DOTFILES_DIR/templates" "$AGENTS_HOME/templates"
link "$DOTFILES_DIR/CHANGELOG.md" "$AGENTS_HOME/CHANGELOG.md"
link "$DOTFILES_DIR/templates/AGENTS.md" "$AGENTS_HOME/AGENTS.template.md"

# --- Codex adapter: same skills under ~/.codex/skills ---
for skill_dir in "$DOTFILES_DIR"/skills/*/; do
  [[ -d "$skill_dir" ]] || continue
  name="$(basename "$skill_dir")"
  link "$skill_dir" "$CODEX_HOME/skills/$name"
done

# --- Cursor adapter: prompts as commands (skills already via ~/.agents/skills) ---
for prompt in "$DOTFILES_DIR"/prompts/*.md; do
  [[ -f "$prompt" ]] || continue
  name="$(basename "$prompt")"
  link "$prompt" "$CURSOR_HOME/commands/$name"
done

echo ""
echo "Done."
echo "  Skills:  $AGENTS_HOME/skills (Cursor/Pi) + $CODEX_HOME/skills (Codex)"
echo "  Prompts: $AGENTS_HOME/prompts + $CURSOR_HOME/commands"
echo "  Template: copy or sync with prompts/sync-agents-md.md"
echo ""
echo "Per project: ensure AGENTS.md exists (prompts/sync-agents-md.md or templates/AGENTS.md)."
