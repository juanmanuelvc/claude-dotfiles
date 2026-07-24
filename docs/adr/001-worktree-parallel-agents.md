# ADR-001: Worktree isolation for goal execution

**Status:** Accepted (adopted for single-goal isolation)  
**Date:** 2026-03-16  
**Updated:** 2026-07-24

## Context

Long-running autonomous agent work (goal loops) must not disturb the user's
primary checkout or allow silent pollution of `main`. Git worktrees give each
goal its own working directory and branch while sharing one object store.

Earlier drafts assumed a Claude Code–specific `isolation: "worktree"` Agent
parameter. The portable approach is harness-agnostic: document the lifecycle in
the `goal` and `git-workflow` skills and use plain `git worktree` commands.

## Decision

1. **Default for multi-step goals:** create a worktree + short-lived branch from
   `origin/main` (`goal/<slug>` or `type/scope/slug`).
2. **Protected `main`:** agents never commit, push, merge, or rebase onto `main`.
3. **No shared agent trunk:** no long-lived `develop` / `agent` playground branch.
4. **Push freely** on the goal branch; **PR to `main`** only with explicit user
   confirmation (`open-pr`); humans merge.
5. **Parallel multi-agent orchestration** (many worktrees at once) remains
   optional and out of scope for the base skills — guardrails below still apply
   if you add it later.

## Guardrails

1. Only parallelise tasks that touch different files.
2. Max 2–3 concurrent agents on a typical machine.
3. Avoid reinstalling dependencies per worktree when a shared cache/symlink works.
4. Keep `AGENTS.md` ≤ ~200 lines (token cost scales with concurrent agents).
5. Remove worktrees after merge.

## Consequences

- `skills/goal/SKILL.md` and `skills/git-workflow/SKILL.md` own the lifecycle.
- A dedicated `/parallel-task` prompt is **not** required for v1.
- GitHub branch protection on `main` is recommended per consumer repo.
