---
description: Stage, review, and commit changes using conventional commit format
---

Stage, review, and commit changes. This is the source of truth for commit procedure.
Short always-on rules live in `AGENTS.md`; follow the steps below when committing.

## Commit Convention (Conventional Commits)

Format: `type(optional-scope): imperative description`

| Type | When to use |
|---|---|
| `feat` | New user-visible feature |
| `fix` | Bug fix |
| `chore` | Maintenance: deps, configs, tooling |
| `docs` | Documentation only |
| `refactor` | Code change with no behaviour change |
| `test` | Add or update tests |
| `perf` | Performance improvement |
| `ci` | CI/CD pipeline changes |

Rules:
- Imperative mood: "add", not "added" or "adds".
- Max 72 chars for the subject line.
- **One-liner only** — no multi-line body unless explicitly requested.
- **No `Co-Authored-By` trailer** — ever.
- Never commit secrets, `.env` files, or large binaries.
- Never commit directly on `main`.

## Steps

1. **Stage specific files** — never `git add -A` blindly:
   ```bash
   git add <file1> <file2> ...
   ```

2. **Review staged changes**:
   ```bash
   git diff --staged
   ```

3. **Commit**:
   ```bash
   git commit -m "type(scope): description"
   ```

Never use `--no-verify` unless the user explicitly requests it.
