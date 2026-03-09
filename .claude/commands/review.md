---
description: Review current staged/unstaged diff for bugs, issues, and regressions
---

Run `git diff HEAD` and review ALL uncommitted changes using `ultrathink`.

Report findings under these headings (omit any section with no issues):

1. **Potential bugs** — classify each as P1 (critical), P2 (important), P3 (minor).
2. **Uncovered edge cases** — inputs or states the new code does not handle.
3. **Performance issues** — obvious algorithmic or I/O inefficiencies.
4. **Convention violations** — deviations from this project's patterns.
5. **Missing tests** — new logic paths that lack test coverage.
6. **Potential regressions** — existing behaviour that the change might break.

Rules:
- Be direct and specific. Always include file path and line number.
- Do not report false positives; if unsure, say so explicitly.
- If there are no issues in a category, skip that section entirely.
- Finish with a one-line overall verdict: LGTM / LGTM with minor notes / Needs fixes.
