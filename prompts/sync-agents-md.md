---
description: Merge the latest agent-skills template into this project's AGENTS.md, preserving project-specific content
---

1. **Locate instructions file**
   - Prefer `./AGENTS.md`.
   - If missing but `./CLAUDE.md` exists, ask whether to migrate it to `AGENTS.md`.
   - If neither exists, ask: "No AGENTS.md found. Initialize from template?" On confirm, copy the installed template (`~/.agents/templates/AGENTS.md` or this repo's `templates/AGENTS.md`) to `./AGENTS.md` and stop.

2. **Read the project's `AGENTS.md`** and extract `template-version` from the top comment (e.g. `[//]: # (template-version: v0.5.0)`). If absent, treat as unknown and warn.

3. **Read the latest template** from `~/.agents/templates/AGENTS.md` (fallback: checkout `templates/AGENTS.md`).

4. **If versions match**, say up to date and stop.

5. **If versions differ**, read this repo's `CHANGELOG.md` (via `~/.agents/CHANGELOG.md` if installed, else the checkout) and show only entries between the two versions.

6. **Ask for confirmation** before merging.

7. **Merge**:
   - Update generic sections (Code Style, Agent Behaviour, Git Guardrails, Commits, Security, Observability, Available Skills, Quality Commands structure).
   - Preserve Project Identity values and any custom sections.
   - Bump `template-version`.

8. **Show a diff** and confirm before writing.

9. If the file exceeds 200 lines, extract domain skills as in `new-project`.
