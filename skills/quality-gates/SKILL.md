---
name: quality-gates
description: Run the project's quality checks (tests, linter, type-checker) before committing or opening a PR, and as the verify step of a goal loop.
---

# Quality Gates

Run all quality checks defined in the project's `AGENTS.md` before committing, opening a PR, or declaring a goal done.

## Steps

1. **Read `AGENTS.md`** (fall back to legacy `CLAUDE.md` only if `AGENTS.md` is absent) for:
   - Test command
   - Linter command
   - Type-checker command

2. **Run each available gate** in order: type-check → lint → test.
   Skip gates the project does not define.

3. **Report** as a checklist:
   ```
   - [x] Type-check: passed
   - [x] Lint: passed (2 warnings)
   - [ ] Tests: 3 failed (list failures)
   ```

4. If any gate fails, **stop and report**. Do not proceed to commit, PR, or goal success.

## Notes

- If no quality commands are defined, ask the user before guessing.
- Run against the full project unless the project documents a faster incremental mode.
