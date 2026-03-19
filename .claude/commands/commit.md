---
description: Stage, review, and commit changes using conventional commit format
---

Stage, review, and commit changes. This is the source of truth for commit conventions.

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
- **One-liner only** — no multi-line body unless explicitly requested.
- **No `Co-Authored-By` trailer** — ever.
- Never commit secrets, `.env` files, or large binaries.

## Steps

1. **Stage specific files** — never `git add -A` blindly:
   ```bash
   git add <file1> <file2> ...
   ```

2. **Review staged changes**:
   ```bash
   git diff --staged
   ```

3. **Write the commit message** following the convention above:
   ```bash
   git commit -m "type(scope): description"
   ```

Never use `--no-verify` unless the user explicitly requests it.
