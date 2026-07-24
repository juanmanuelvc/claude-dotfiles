---
name: session
description: Use this skill when context is filling up, when pausing a long task, when resuming from a handoff, or when deciding whether to delegate exploration.
---

# Session Hygiene

Harness-neutral guidance for context pressure and pause/resume.
Do not depend on vendor-specific compact/clear commands.

## When to act

| Signal | Action |
|---|---|
| Context feels crowded mid-task | Run `handoff`, then start a fresh session with the handoff path |
| Independent exploration would pollute the thread | Delegate to a separate agent/session with a narrow brief |
| Same instructions written 2–3 times | Move them into a skill or prompt in this repo |
| `AGENTS.md` exceeds ~200 lines | Split deep domain knowledge into skills |
| Multi-step autonomous work | Use the `goal` skill (branch/worktree + verify loop) |
| Reviewing a large diff | Use the `review` prompt; be specific with paths and lines |

## Handoff before resetting context

Always run the `handoff` prompt before abandoning a long session.
Handoff files live at `../scratchpad/<project-name>/handoff-<date>.md`.

For goal work, also update the goal file Progress section (see `goal` skill).

## Reducing noise

- Keep `AGENTS.md` under ~150–200 lines.
- Skills load on demand — rely on descriptions, not always-on dumps.
- Prefer Read/Grep tools over pasting large files into chat.
- Summarise large exploration results before continuing in the main thread.

## Delegation

Delegate when the work is independent, would flood the main context, or needs a fresh pass (e.g. review). Pass only the brief and paths needed — not the whole conversation.
