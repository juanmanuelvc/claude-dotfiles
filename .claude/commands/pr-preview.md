---
description: Pre-PR pipeline — review, simplify, quality gates, commit, and open PR
---

Run the full pre-PR pipeline using `ultrathink`. Execute each step sequentially.
After steps 1-3, present all findings as a single consolidated report and ask the user
for permission to fix issues before continuing. Do not skip steps.

## Pipeline

### Step 1 — Code Review

Run the `/review` command: review all uncommitted changes for bugs, edge cases,
regressions, convention violations, and missing tests.

### Step 2 — Simplify

Run the `/simplify` skill: review changed code for reuse opportunities, quality
issues, and efficiency improvements. Apply fixes immediately — simplify changes are
safe and mechanical and do not require a checkpoint.

### Step 3 — Quality Gates

Load `.claude/skills/quality-gates/SKILL.md` and run all project quality checks
(tests, linter, type-checker).

---

**Checkpoint:** Present a consolidated report of all findings from steps 1-3.
If there are issues, list them all and ask the user for permission to fix them.
Do not proceed to step 4 until the user confirms.

---

### Step 4 — Commit

Run the `/commit` command: stage specific files, review the diff, and write a
conventional commit message.

### Step 5 — Open PR

Load `.claude/skills/open-pr/SKILL.md` and follow the PR creation flow: analyse
branch diff, propose title and body, wait for user confirmation before creating.
