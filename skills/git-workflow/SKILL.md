---
name: git-workflow
description: Use this skill for git operations: creating branches, worktrees, rebasing, resolving conflicts, or preparing to merge. For commits use the commit prompt; for PRs use open-pr; for autonomous multi-step work use goal.
---

# Git Workflow

## Protected main

- `main` (or `master`) is always releasable and **protected**.
- Never commit, push, merge, or rebase onto `main` from an agent session.
- Merge happens only via GitHub PR after human confirmation (`open-pr`).

## Branch flow (trunk-based)

No persistent integration branches (`develop`, `agent`, etc.).
One logical change (or one goal) per short-lived branch.

1. Update and branch from `main`:
   ```bash
   git fetch origin
   git checkout -b type/scope/slug origin/main
   ```
2. Naming: `type/scope/slug` — e.g. `feat/auth/oauth-login`, `fix/cart/dupe-items`.
   Scope optional: `feat/oauth-login`. Autonomous loops may use `goal/<slug>`.
3. Push the feature/goal branch freely: `git push -u origin HEAD`.
4. Before PR: rebase onto latest `origin/main` on the **feature branch only**.
5. After merge: delete the remote branch; remove any worktree.

## Worktrees

Prefer a worktree for multi-step or long-running work (see `goal` skill):

```bash
git worktree add -b goal/<slug> ../<project>-goal-<slug> origin/main
```

Cleanup after merge:

```bash
git worktree remove ../<project>-goal-<slug>
```

## Commits

Use the `commit` prompt for conventions and the staging/review/commit steps.

## Pull requests

Use `open-pr` only when the user explicitly asks. Keep PRs small; link issues with `Closes #N`.

## Conflict resolution

1. Understand both sides before resolving.
2. Prefer the version that matches the project's current direction.
3. If unsure, ask — do not guess.
4. After resolving, run tests before continuing.

## Useful one-liners

```bash
git rebase origin/main          # on feature branch only
git reset --soft HEAD~1         # undo last commit, keep staged
git diff HEAD~1 --name-only
git stash -u
```
