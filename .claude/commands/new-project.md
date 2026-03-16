---
description: Scaffold a new project from scratch — asks about stack, creates structure, and populates CLAUDE.md
---

Ask me the following questions **one at a time**, waiting for my answer before moving on:

1. What is the purpose of this project? (1–2 sentences)
2. Do you have a preferred language / framework, or should I suggest one based on the purpose?
3. What package manager do you want to use? (or "suggest" to let me recommend)
4. Will this have a backend, frontend, both, or is it a library/CLI/other?
5. Do you want tests set up from the start? If so, any preference for the testing framework?

Once you have all answers:

1. **Recommend a stack** if the user deferred to you — explain the choice in one sentence.
2. **Scaffold the initial structure**: create the minimal directory layout and config files for the chosen stack (e.g. `package.json`, `pyproject.toml`, `.gitignore`, `src/`, `tests/`). Do not generate placeholder source files beyond what the toolchain requires.
3. **Write `CLAUDE.md`** at the project root using `~/.claude/templates/CLAUDE.md` as the base, filling in the stack, package manager, and any project-specific conventions discovered during scaffolding. Remove placeholder comments.
4. **Initialise git**: run `git init`, stage everything, and create the first commit with message `chore: initial project scaffold`.

After finishing, print a one-paragraph summary of what was created and the suggested first next step.
