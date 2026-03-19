---
name: quality-gates
description: Run the project's quality checks (tests, linter, type-checker) before committing or opening a PR.
---

# Quality Gates

Run all quality checks defined in the project's CLAUDE.md before committing or opening a PR.

## Steps

1. **Read the project's CLAUDE.md** to identify:
   - Test command (e.g. `npm test`, `pytest`, `cargo test`)
   - Linter command (e.g. `eslint .`, `ruff check .`, `clippy`)
   - Type-checker command (e.g. `tsc --noEmit`, `mypy .`, `pyright`)

2. **Run each available gate** in order: type-check, lint, test.
   Skip any gate that the project does not define.

3. **Report results** as a checklist:
   ```
   - [x] Type-check: passed
   - [x] Lint: passed (2 warnings)
   - [ ] Tests: 3 failed (list failures)
   ```

4. If any gate fails, **stop and report**. Do not proceed to commit or PR.

## Notes

- If CLAUDE.md does not define any quality commands, ask the user before guessing.
- Run gates against the full project, not just changed files, unless the project documents a faster incremental mode.
