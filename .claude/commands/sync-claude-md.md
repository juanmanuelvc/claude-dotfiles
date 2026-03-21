---
description: Merge the latest claude-dotfiles template into this project's CLAUDE.md, preserving project-specific content
---

1. **Check if `CLAUDE.md` exists** in the current project directory.
   - If it does **not** exist, ask the user: "No CLAUDE.md found. Initialize from template?" If they confirm, copy `~/.claude/templates/CLAUDE.md` to `./CLAUDE.md` and stop — no further steps needed.
   - If it exists, continue.

2. **Read the project's `CLAUDE.md`** and extract the `template-version` value from the comment at the top (e.g. `[//]: # (template-version: v0.1.0)`). If the marker is absent, treat the version as unknown and warn the user.

3. **Read `~/.claude/templates/CLAUDE.md`** to get the latest template and its version marker.

4. **If versions match**, tell the user their CLAUDE.md is already up to date and stop.

5. **If versions differ**, read `~/.claude/CHANGELOG.md` and show the user only the changelog entries between their version and the current version so they understand what changed in the template.

6. **Ask the user for confirmation** before proceeding with the merge.

7. **Merge** the template changes into the project's `CLAUDE.md`:
   - Apply all changes from template sections that are generic rules (Code Style, Agent Behaviour, Commits, Security, Observability, Available Skills table).
   - Preserve all project-specific content (Project Identity fields, any custom sections the project has added below the template sections).
   - Update the `template-version` marker to the latest version.
   - Do not reorder or remove project-specific sections.

8. **Show a diff** of what changed in the project's `CLAUDE.md` and ask the user to confirm before writing the file.

9. After writing, check the file's line count. If it exceeds 200 lines, follow the same skill-extraction process as `/new-project` (step 4).
