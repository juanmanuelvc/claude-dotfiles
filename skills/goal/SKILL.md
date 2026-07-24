---
name: goal
description: Use this skill for multi-step autonomous work with a measurable done-when condition — plan, implement, verify, and iterate until success or a hard stop. Never merge to main; end with a confirmation-gated PR.
---

# Goal Loop

Autonomous plan → act → verify until the objective is met, blocked, or paused.
Mirrors Codex-style `/goal` semantics without depending on a specific harness.

## Preconditions

1. Read the project's `AGENTS.md` (or nearest agent instructions).
2. Confirm you are **not** on `main` / `master`. If you are, stop and cut a branch first.
3. Prefer a **git worktree** for multi-step goals so the user's primary checkout stays clean.

## 1. Write the goal contract

Create or update a durable goal file (prefer `../scratchpad/<project>/goals/<slug>.md`, else `.agents/goals/<slug>.md`):

```markdown
# Goal: <slug>

## Objective
<one paragraph>

## Constraints
- ...

## Done when
- [ ] <command or observable check>
- [ ] ...

## Stop when
- Ambiguous product/architecture choice requiring the user
- Secrets, production data, or destructive irreversible ops
- Unexpected lockfile churn or dependency changes outside scope
- Token/time budget exhausted (if set)

## Progress
- ...
```

Do not start implementing until **Objective**, **Done when**, and **Stop when** are filled.

## 2. Isolate

```bash
git fetch origin
git checkout main && git pull origin main   # only to update main locally if needed
# Preferred: worktree
git worktree add -b goal/<slug> ../<project>-goal-<slug> origin/main
cd ../<project>-goal-<slug>
```

If already on a suitable short-lived feature branch the user chose, keep it — do not create a second branch.

**Forbidden:** shared `develop` / `agent` branches; any commit or push to `main`.

## 3. Loop

Repeat until a terminal state:

1. **Plan** the next smallest change that advances a done-when check.
2. **Act** — implement; use `tdd` for logic changes; commit with the `commit` prompt when a coherent chunk is done.
3. **Verify** — run the done-when checks and `quality-gates` when approaching completion.
4. **Update** the Progress section of the goal file.
5. If a **Stop when** condition hits → pause (step 5). If all **Done when** checks pass → exit (step 4).

Push the goal branch freely for backup:

```bash
git push -u origin HEAD
```

## 4. Exit (success)

1. Rebase or fast-forward onto latest `origin/main` **on the goal branch only**.
2. Run `quality-gates` — stop and fix on failure.
3. Load `open-pr` and open a PR **only after explicit user confirmation**.
4. Do **not** merge. Leave merge to the human / branch protection.

## 5. Pause / blocker

1. Update Progress with why you stopped and exact next steps.
2. Run the `handoff` prompt (scratchpad summary).
3. Ensure the goal branch is pushed.
4. Tell the user how to resume (goal file path + branch name).

## Rules

- Maker ≠ verifier: do not declare success without running done-when checks / quality-gates.
- Never use `--no-verify`, force-push to shared branches, or skip the PR confirmation gate.
- Keep PRs small: one goal → one PR when possible.
