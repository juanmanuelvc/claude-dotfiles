---
description: Scaffold a new project from scratch — asks about stack, creates structure, and populates AGENTS.md
---

Ask the following questions **one at a time**, waiting for an answer before continuing:

1. What is the purpose of this project? (1–2 sentences)
2. Preferred language / framework, or should I suggest one?
3. Package manager? (or "suggest")
4. Backend, frontend, both, or library/CLI/other?
5. Tests from the start? Framework preference?
6. CI/CD? (yes / no / suggest) — if yes/suggest: GitHub?

Once you have all answers:

1. **Recommend a stack** if deferred — one-sentence rationale.
2. **Scaffold** minimal directory layout and toolchain config. No placeholder source beyond what the toolchain requires.
3. **Versioning**:
   - **CI/CD on GitHub**: `git cliff --init`, copy this repo's `templates/changelog.yml` to `.github/workflows/changelog.yml`.
   - **No CI/CD**: `git cliff --init`; note manual release steps in the project README.
   - **No versioning**: skip.
   - **Publishing artifacts**: use `release-please` — see the `versioning` skill.
4. **Write `AGENTS.md`** from `templates/AGENTS.md` (global install path or this repo checkout), fill Project Identity and Quality Commands, remove placeholders.
5. **Length check**: if `AGENTS.md` > 200 lines, extract deep domain sections into project skills under `.agents/skills/<topic>/SKILL.md`, reference them in Available Skills, repeat until ≤ 200 lines.
6. **Git**: `git init`, stage, first commit `chore: initial project scaffold` on a non-`main` first commit only if already on main for a brand-new repo — initial commit on `main` is allowed for empty repo bootstrap.

Print a one-paragraph summary and the suggested first next step.
