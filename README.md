# agent-skills (formerly claude-dotfiles)

Portable **Agent Skills**, prompts, and `AGENTS.md` templates for coding agents
(Cursor, Codex, Pi, and peers). Sync across devices with git + `scripts/install.sh`.

> GitHub repo rename to `agent-skills` is planned; local directory may still be `claude-dotfiles`.

## Layout

```
AGENTS.md                 # Instructions for this repo
skills/                   # Portable Agent Skills (SKILL.md)
prompts/                  # Invokable workflows (commit, handoff, goal, …)
templates/
  AGENTS.md               # Per-project starter (versioned)
  changelog.yml           # Optional GitHub Action for new projects
adapters/
  cursor/                 # Notes (skills via ~/.agents)
  codex/                  # Notes (~/.codex/skills install)
  claude/                 # Legacy hooks (not installed)
scripts/install.sh        # Symlink core + adapters into home dirs
docs/audit/               # Migration audit
docs/adr/                 # Architecture decisions
```

## Design

| Layer | Role |
|---|---|
| `AGENTS.md` | Always-on non-negotiables (~150 lines target) |
| `skills/` | On-demand procedures (goal loop, TDD, PR gate, …) |
| `prompts/` | Explicit workflows / slash-style commands |
| `adapters/` | Path notes only — no duplicated policy |

**Git control plane:** protected `main`; one goal → one short-lived branch (prefer worktree);
free push on that branch; human confirms PR to `main`. No shared `develop` agent branch.

## Setup (once per machine)

```bash
bash scripts/install.sh
```

Installs:

- Skills → `~/.agents/skills/` (Cursor, Pi) and `~/.codex/skills/` (Codex)
- Prompts → `~/.agents/prompts/` and `~/.cursor/commands/`
- Templates + CHANGELOG → `~/.agents/`

Pulling this repo updates all machines that re-run or already symlink here.

## Per-project

```text
# In the project (Cursor command / prompt)
sync-agents-md
```

Or copy `templates/AGENTS.md` to the project root as `AGENTS.md` and fill
Project Identity + Quality Commands.

## Goal workflow

For multi-step autonomous work, load the `goal` skill (or `prompts/goal.md`):

1. Write a goal contract (objective, done-when, stop-when).
2. Cut `goal/<slug>` from `origin/main` (worktree preferred).
3. Plan → act → verify until done or blocked.
4. Run quality gates; open a PR only after confirmation — never merge as the agent.

## Scratchpad

`handoff` writes to `../scratchpad/<project-name>/` (sibling of the project),
kept in a private repo for cross-device session resume:

```bash
mkdir -p ../scratchpad && cd ../scratchpad && git init && gh repo create scratchpad --private --source=.
```

## Dependencies

- [`git-cliff`](https://git-cliff.org) — changelog generation for versioned projects.

## Branch protection (recommended)

On each GitHub repo: require PRs to `main`, dismiss stale reviews, require status checks.
Agents must not push to `main`.

## Disclaimer

Personal config shared as-is. Structure may change as workflows evolve.
