---
description: Generate a session summary before resetting context or pausing a long task
---

Before closing or resetting context:

- Determine the project name with `basename "$PWD"`.
- Run `mkdir -p ../scratchpad/<project-name>` if needed.
- Create `../scratchpad/<project-name>/handoff-<YYYY-MM-DD>.md` with:

1. **Session goal** — what we were trying to achieve.
2. **Changes made** — modified/created files with a one-line summary each.
3. **Current state** — what works, what doesn't, what is partial.
4. **Decisions made** — key design choices and rationale.
5. **Next steps** — pending tasks by priority.
6. **Critical context** — anything painful to reconstruct cold.
7. **Branch / goal file** — branch name and path to any goal contract if applicable.

Format: Markdown. Be concise but omit nothing critical.
After writing, tell me the path and a one-sentence summary of where we left off.
