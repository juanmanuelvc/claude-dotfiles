---
name: git-workflow
description: Use this skill for git operations: creating branches, opening PRs, merging, rebasing, or resolving conflicts. For commit conventions, use /commit.
---

# Git Workflow

## Commits

For commit conventions and the full staging/review/commit workflow, run `/commit`.
The `/commit` command is the source of truth for commit format and rules.

## Branch Flow (Trunk-Based Development)

`main` is the trunk — always releasable. There are no persistent integration branches.
All work happens on short-lived branches cut directly from `main` and merged back via PR.

1. Always branch from an up-to-date `main` (or `master`):
   ```bash
   git checkout main && git pull origin main
   git checkout -b type/scope/slug
   ```
2. Naming: `type/scope/slug` — e.g. `feat/auth/oauth-login`, `fix/cart/dupe-items`
   Scope is optional: `feat/oauth-login` is fine when scope is obvious.
3. One logical change per PR.
4. Merge via PR only — never merge locally to main. Use the "Squash and merge" strategy on GitHub; delete the branch immediately after merge.

## Before Every Commit

Run `/commit` for the full workflow. For quality checks before a PR, run `/pr-preview`.

## Pull Requests

- Title: same format as a commit message.
- Body: what changed, why, and how to test it.
- Keep PRs small — easier to review, faster to merge.
- Link the issue it closes: `Closes #123`.

## Conflict Resolution

1. Understand both sides before resolving.
2. Prefer the version that better matches the project's current direction.
3. If unsure, ask the user rather than guessing.
4. After resolving: run tests before marking resolved.

## Useful One-Liners

```bash
# Interactive rebase to clean up commits before PR
git rebase -i origin/main

# Undo last commit but keep changes staged
git reset --soft HEAD~1

# Show files changed in the last commit
git diff HEAD~1 --name-only

# Stash everything including untracked files
git stash -u
```
