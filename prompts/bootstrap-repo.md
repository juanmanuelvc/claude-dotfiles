---
description: Explore the repository and generate onboarding documentation
---

Investigate this repository thoroughly (use parallel sub-agents or separate exploration
passes if the harness supports them), then generate `docs/repo-overview.md` containing:

1. **Purpose** — what the project does in 2–3 sentences.
2. **Architecture** — ASCII diagram of main modules and relationships.
3. **Stack** — languages, frameworks, key libraries and versions.
4. **Entry points** — main startup, config, and build files.
5. **Data flow** — how data moves end-to-end.
6. **Detected conventions** — naming, directory structure, code style.
7. **Tests** — how to run them, coverage, known gaps.
8. **Technical debt** — TODO/FIXME/HACK comments found.

After writing, print a one-paragraph summary of the most important findings.
