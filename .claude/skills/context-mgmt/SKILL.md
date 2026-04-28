---
name: context-mgmt
description: Use this skill when context is filling up, when deciding whether to compact or clear, or when planning a session handoff.
---

# Context Management

## When to Act

| Signal                                      | Recommended action                          |
|---------------------------------------------|---------------------------------------------|
| Context bar reaches ~60% on a complex task  | `/handoff` → `/compact` or `/clear`         |
| Starting an independent exploration task    | Delegate to a fresh Explore sub-agent       |
| Same prompt written 2–3 times               | Move it to a Skill or slash command         |
| `CLAUDE.md` exceeds ~200 lines              | Split surplus content into topic Skills     |
| Long-running process to monitor             | Launch as a background agent                |
| Reviewing own changes                       | Use `ultrathink`                            |

## Handoff Before Compacting

Always run `/handoff` before `/compact` or `/clear` on a long session.
The handoff file is written to `../scratchpad/<project-name>/handoff-<date>.md`
(shared across devices; the directory is created automatically if it doesn't exist) and captures:
- Session goal
- Files changed and why
- Current state (working / broken / partial)
- Design decisions made
- Next steps by priority
- Critical context that is painful to reconstruct

## Reducing Context Noise

- Keep `CLAUDE.md` under ~150–200 lines. Move deep domain knowledge to Skills.
- Skills are only loaded when the agent detects relevance — zero token cost otherwise.
- Slash commands are static prompts; they don't live in context until invoked.
- Avoid pasting large files into the chat; use Read/Grep tools instead.
- If a sub-agent exploration returns too much data, summarise it before continuing.

## Sub-agent Strategy

Delegate to sub-agents for tasks that:
- Are independent of the current thread (parallel exploration).
- Would pollute the main context with large intermediate results.
- Need a fresh perspective (e.g. a second review pass).

Pass sub-agents only the context they need — not the entire conversation.

## Compacting vs. Clearing

| `/compact`                         | `/clear`                                  |
|------------------------------------|-------------------------------------------|
| Keeps a compressed summary         | Wipes context entirely                    |
| Good when you need continuity      | Good when the task is fully done          |
| Loses some detail                  | Fastest; requires handoff file to resume  |

Default: prefer `/compact` unless the session is fully complete.
