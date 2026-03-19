#!/usr/bin/env bash
# install.sh — symlink claude-dotfiles into ~/.claude/
# Run once: bash scripts/install.sh
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
CLAUDE_DIR="$HOME/.claude"

echo "Installing claude-dotfiles from $DOTFILES_DIR"

mkdir -p "$CLAUDE_DIR"

link() {
  local src="$1" dst="$2"
  if [[ -e "$dst" && ! -L "$dst" ]]; then
    echo "  SKIP $dst (exists and is not a symlink — back it up manually)"
    return
  fi
  ln -sf "$src" "$dst"
  echo "  LINK $dst -> $src"
}

link "$DOTFILES_DIR/.claude/commands"     "$CLAUDE_DIR/commands"
link "$DOTFILES_DIR/.claude/settings.json" "$CLAUDE_DIR/settings.json"
link "$DOTFILES_DIR/.claude/skills"       "$CLAUDE_DIR/skills"
link "$DOTFILES_DIR/templates"            "$CLAUDE_DIR/templates"

echo ""
echo "Done. To add a CLAUDE.md to a project:"
echo "  cp $DOTFILES_DIR/templates/CLAUDE.md /path/to/project/CLAUDE.md"
