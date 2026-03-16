# claude-dotfiles

Reusable Claude Code configuration files shared across all personal projects.

## Structure

```
claude-dotfiles/
├── CLAUDE.md                          # This repo's own agent instructions
├── .claude/
│   ├── commands/                      # Custom slash commands
│   │   ├── handoff.md                 # /handoff — session summary before /clear
│   │   ├── bootstrap-repo.md          # /bootstrap-repo — generate onboarding docs
│   │   ├── new-project.md             # /new-project — scaffold a greenfield project
│   │   └── review.md                  # /review — review current diff for bugs
│   ├── settings.json                  # Hooks: Stop, PostToolUse, PreToolUse, UserPromptSubmit
│   └── skills/                        # On-demand skill files (loaded by hooks)
│       ├── git-workflow/SKILL.md      # Branch flow, commits, PRs, conflict resolution
│       └── context-mgmt/SKILL.md     # When/how to compact, hand off, delegate
├── templates/
│   └── CLAUDE.md                      # Starter template — copy into new projects
├── scripts/
│   └── install.sh                     # One-time setup: symlinks .claude/* into ~/.claude/
└── scratchpad/                        # Handoff files written by /handoff
```

## Setup (once)

```bash
bash scripts/install.sh
```

This symlinks `.claude/commands`, `.claude/settings.json`, and `.claude/skills` into `~/.claude/`,
making commands, hooks, and skills available globally in every project.

## Per-project setup

```bash
cp templates/CLAUDE.md /path/to/my-project/CLAUDE.md
# then edit the stack/package manager fields at the top
```

## Staying up-to-date

```bash
cd ~/workspace/claude-dotfiles
git pull
```

Because everything is symlinked, pulling here immediately updates all projects — no re-running the install script needed.

## Based on

*"A Guide to Claude Code 2.0 and getting better at using coding agents"* — sankalp, Dec 2025
