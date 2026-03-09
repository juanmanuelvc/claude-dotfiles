# claude-dotfiles

Reusable Claude Code configuration files shared across all personal projects.

## Structure

```
claude-dotfiles/
├── CLAUDE.md                          # Global agent instructions (injected every message)
├── .claude/
│   ├── commands/                      # Custom slash commands
│   │   ├── handoff.md                 # /handoff — session summary before /clear
│   │   ├── bootstrap-repo.md          # /bootstrap-repo — generate onboarding docs
│   │   └── review.md                  # /review — review current diff for bugs
│   ├── agents/                        # Custom sub-agents (add .md files here)
│   └── settings.json                  # Hooks: Stop, PostToolUse, PreToolUse, UserPromptSubmit
├── skills/
│   ├── git-workflow/SKILL.md          # Branch flow, commits, PRs, conflict resolution
│   └── context-mgmt/SKILL.md         # When/how to compact, hand off, delegate
└── scratchpad/                        # Handoff files written by /handoff
```

## Usage

Symlink or copy this repo's files into your home directory so Claude Code picks them up globally:

```bash
# Global CLAUDE.md (Claude Code reads ~/.claude/CLAUDE.md automatically)
ln -sf ~/claude-dotfiles/CLAUDE.md ~/.claude/CLAUDE.md

# Commands and settings
ln -sf ~/claude-dotfiles/.claude/commands ~/.claude/commands
ln -sf ~/claude-dotfiles/.claude/settings.json ~/.claude/settings.json
```

Or reference individual files from a project's own `CLAUDE.md`.

## Based on

*"A Guide to Claude Code 2.0 and getting better at using coding agents"* — sankalp, Dec 2025
