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
│   │   ├── sync-claude-md.md          # /sync-claude-md — merge template updates into a project
│   │   └── review.md                  # /review — review current diff for bugs
│   ├── settings.json                  # Hooks: Stop, PostToolUse, PreToolUse, UserPromptSubmit
│   └── skills/                        # On-demand skill files (loaded by hooks)
│       ├── git-workflow/SKILL.md      # Branch flow, commits, PRs, conflict resolution
│       ├── context-mgmt/SKILL.md     # When/how to compact, hand off, delegate
│       ├── tdd/SKILL.md               # Red-Green-Refactor cycle and testing rules
│       ├── open-pr/SKILL.md           # Consistent, confirmation-gated PR creation
│       └── versioning/SKILL.md        # Semver, git-cliff changelog automation
├── templates/
│   └── CLAUDE.md                      # Starter template — copy into new projects
├── scripts/
│   └── install.sh                     # One-time setup: symlinks .claude/* into ~/.claude/
└── scratchpad/                        # Handoff files written by /handoff
```

## Dependencies

- [`git-cliff`](https://git-cliff.org) — changelog generation. See the [installation docs](https://git-cliff.org/docs/installation) for your OS.

## Setup (once)

```bash
bash scripts/install.sh
```

This symlinks `.claude/commands`, `.claude/settings.json`, and `.claude/skills` into `~/.claude/`,
making commands, hooks, and skills available globally in every project.

## Per-project setup

Open a project in Claude Code and run:

```
/sync-claude-md
```

If no `CLAUDE.md` exists yet, the skill will offer to initialize one from the template.
If one already exists, it will merge any template updates while preserving project-specific content.

## Versioning new projects

When `/new-project` scaffolds a project, it sets up `git-cliff` for changelog generation by default:

- Runs `git cliff --init` to create `cliff.toml`
- If the project is on GitHub, copies `.github/workflows/changelog.yml` from the templates — `CHANGELOG.md` is regenerated automatically whenever a version tag is pushed

**Release workflow:**
```bash
git cliff --unreleased        # preview what's going in
git tag v1.2.0
git push origin main v1.2.0  # CI generates CHANGELOG.md automatically
```

Without CI, generate manually before tagging:
```bash
git cliff --tag v1.2.0 -o CHANGELOG.md
git add CHANGELOG.md && git commit -m "chore: release v1.2.0"
git tag v1.2.0 && git push origin main v1.2.0
```

For projects that publish artifacts (npm, pip, Docker), use `release-please` instead — see the versioning skill.

## Staying up-to-date

```bash
cd ~/workspace/claude-dotfiles
git pull
```

Because everything is symlinked, pulling here immediately updates all projects — no re-running the install script needed.

## Disclaimer

Personal dotfiles shared as-is. No stability guarantees — structure and skills may change as my workflow evolves. Contributions and issues are welcome, but this is primarily built for my own use.

## Acknowledgements

Inspired by *"A Guide to Claude Code 2.0 and getting better at using coding agents"* by Sankalp Shubham (Dec 2025).
