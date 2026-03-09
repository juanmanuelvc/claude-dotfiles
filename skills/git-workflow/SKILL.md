---
name: git-workflow
description: Use this skill for git operations: creating branches, writing semantic commits, opening PRs, resolving conflicts, rebasing, or any git workflow task.
---

# Git Workflow

## Commit Convention (Conventional Commits)

Format: `type(optional-scope): imperative description`

| Type       | When to use                                  |
|------------|----------------------------------------------|
| `feat`     | New user-visible feature                     |
| `fix`      | Bug fix                                      |
| `chore`    | Maintenance: deps, configs, tooling          |
| `docs`     | Documentation only                           |
| `refactor` | Code change with no behaviour change         |
| `test`     | Add or update tests                          |
| `perf`     | Performance improvement                      |
| `ci`       | CI/CD pipeline changes                       |

Examples:
```
feat(auth): add OAuth2 login support
fix(cart): prevent duplicate item entries
chore(deps): upgrade vitest to v2
```

Rules:
- Imperative mood: "add", not "added" or "adds".
- Max 72 chars for the subject line.
- Add a body paragraph when the *why* is non-obvious.
- Never commit secrets, `.env` files, or large binaries.

## Branch Flow

1. Always branch from an up-to-date `main` (or `master`):
   ```bash
   git checkout main && git pull origin main
   git checkout -b type/short-description
   ```
2. Naming: `type/short-description` — e.g. `feat/user-auth`, `fix/cart-dupe`
3. One logical change per PR.
4. Squash-merge to main; delete the branch after merge.

## Before Every Commit

```bash
git diff --staged          # review exactly what will be committed
# run tests
git commit -m "type(scope): description"
```

Never use `git add -A` blindly — stage specific files.
Never use `--no-verify` unless the user explicitly requests it.

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
