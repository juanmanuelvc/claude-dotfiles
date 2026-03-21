---
description: Generate a session summary before running /clear or /compact
---

Before closing the context, create a file `scratchpad/handoff-<YYYY-MM-DD>.md`
(use today's actual date) with the following sections:

1. **Session goal** — what we were trying to achieve.
2. **Changes made** — list of modified/created files with a one-line summary each.
3. **Current state** — what works, what doesn't, what is partially done.
4. **Decisions made** — key design/architecture choices and their rationale.
5. **Next steps** — pending tasks ordered by priority.
6. **Critical context** — anything that would be painful to reconstruct cold.

Format: Markdown. Be concise but omit nothing critical.
After writing the file, tell me the path and a one-sentence summary of where we left off.
