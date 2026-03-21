---
description: Scaffold a new project from scratch — asks about stack, creates structure, and populates CLAUDE.md
---

Ask me the following questions **one at a time**, waiting for my answer before moving on:

1. What is the purpose of this project? (1–2 sentences)
2. Do you have a preferred language / framework, or should I suggest one based on the purpose?
3. What package manager do you want to use? (or "suggest" to let me recommend)
4. Will this have a backend, frontend, both, or is it a library/CLI/other?
5. Do you want tests set up from the start? If so, any preference for the testing framework?
6. Do you want a CI/CD pipeline? (yes / no / suggest)
   - If yes or suggest: will this be hosted on GitHub?

Once you have all answers:

1. **Recommend a stack** if the user deferred to you — explain the choice in one sentence.
2. **Scaffold the initial structure**: create the minimal directory layout and config files for the chosen stack (e.g. `package.json`, `pyproject.toml`, `.gitignore`, `src/`, `tests/`). Do not generate placeholder source files beyond what the toolchain requires.
3. **Set up versioning and changelog** based on the CI/CD answer:
   - **CI/CD on GitHub**: run `git cliff --init` to create `cliff.toml`, then copy `~/.claude/templates/changelog.yml` to `.github/workflows/changelog.yml`. This auto-generates `CHANGELOG.md` whenever a version tag is pushed.
   - **No CI/CD**: run `git cliff --init` to create `cliff.toml`. Note in the project README that releases are cut manually: preview with `git cliff --unreleased`, generate with `git cliff --tag vX.Y.Z -o CHANGELOG.md`, then commit and tag.
   - **No versioning wanted**: skip this step.
   - **Publishing artifacts** (npm, pip, Docker): use `release-please` instead — see the versioning skill for setup.
4. **Write `CLAUDE.md`** at the project root using `~/.claude/templates/CLAUDE.md` as the base, filling in the stack, package manager, and any project-specific conventions discovered during scaffolding. Remove placeholder comments.
5. **Check `CLAUDE.md` length**: count its lines.
   - If ≤ 200 lines: proceed.
   - If > 200 lines: analyse the file to identify sections that are deep domain knowledge (framework conventions, testing patterns, deployment specifics, etc.) rather than core agent behaviour rules. For each identified section, create a skill file at `.claude/skills/<topic>/SKILL.md`, add a reference to it in the `## Available Skills` section of `CLAUDE.md`, and remove the extracted content from `CLAUDE.md`. Repeat until the file is under 200 lines.
6. **Initialise git**: run `git init`, stage everything, and create the first commit with message `chore: initial project scaffold`.

After finishing, print a one-paragraph summary of what was created and the suggested first next step.
