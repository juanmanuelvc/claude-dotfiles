---
description: Pre-PR pipeline — review, quality gates, commit, open PR
---

Run the pre-PR pipeline. Prefer the `goal` skill when the work is still incomplete;
use this prompt when implementation is done and you need a final ship path.

Execute sequentially. After steps 1–2, present findings and ask permission to fix before continuing.

## Pipeline

### Step 1 — Code review

Follow `prompts/review.md` on all uncommitted changes (or the branch diff vs base if clean).

### Step 2 — Quality gates

Load `skills/quality-gates/SKILL.md` and run all project quality checks.

**Checkpoint:** consolidated report from steps 1–2. Ask before fixing. Do not proceed until the user confirms.

### Step 3 — Commit

Follow `prompts/commit.md` for any remaining uncommitted work.

### Step 4 — Open PR

Load `skills/open-pr/SKILL.md`. Propose title/body; wait for explicit confirmation before creating.
