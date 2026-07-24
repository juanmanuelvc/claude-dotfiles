---
description: Review current staged/unstaged diff for bugs, issues, and regressions
---

Run `git diff HEAD` and review ALL uncommitted changes.

Report findings under these headings (omit any section with no issues):

1. **Potential bugs** — P1 (critical), P2 (important), P3 (minor).
2. **Uncovered edge cases**
3. **Performance issues** — obvious algorithmic or I/O inefficiencies.
4. **Convention violations** — deviations from this project's patterns.
5. **Missing tests** — new logic paths without coverage.
6. **Potential regressions**
7. **Simplification** — obvious duplication or dead code introduced by the change (apply only mechanical safe cleanups after asking if non-trivial).

Rules:
- Be direct and specific. Always include file path and line number.
- Do not report false positives; if unsure, say so explicitly.
- Finish with a one-line verdict: LGTM / LGTM with minor notes / Needs fixes.
