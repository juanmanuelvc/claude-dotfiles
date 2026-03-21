# ADR-001: Worktree workflow for parallel agent execution

**Status:** Proposed
**Date:** 2026-03-16

## Context

Claude Code supports an `isolation: "worktree"` parameter on the Agent tool that creates a
temporary git worktree for each spawned agent. This makes it possible to run multiple agents
in parallel, each working on an independent branch without interfering with each other or with
the main working tree.

We considered adding a dedicated skill (`worktrees/SKILL.md`) and a `/parallel-task` command
to formalise this pattern across projects.

## Decision drivers

- Parallel agent execution can significantly reduce wall-clock time on independent tasks.
- Git worktrees share the object store, so there is no full repo duplication.
- However, everything outside the object store (dependencies, build caches, compiled outputs)
  is duplicated per worktree, which has non-trivial resource implications.
- Token consumption scales linearly with the number of parallel agents:
  `CLAUDE.md` and any loaded skills are injected into every agent's context on every message.

## Resource implications

| Resource | Impact |
|---|---|
| Disk (source files) | Multiplied by N worktrees (shared git objects, not shared working tree) |
| Disk (dependencies) | Multiplied by N — `node_modules`, `.venv`, build artifacts are not shared |
| CPU / RAM | Proportional to concurrent builds, tests, or tool executions across agents |
| Tokens (CLAUDE.md) | N × message count × CLAUDE.md size — makes the 200-line cap load-bearing |
| Tokens (skills) | Each agent loads skills independently; no sharing between contexts |
| Tokens (file reads) | No deduplication — two agents reading the same file each pay the full cost |

## Guardrails (agreed)

1. **Only parallelise tasks that touch different files.** Shared-file tasks produce merge
   conflicts and negate the benefit of parallelism.
2. **Max 2–3 concurrent agents** on a typical developer machine. Beyond that, resource
   contention outweighs the time saving.
3. **Avoid re-installing dependencies inside agents** when the worktree can reference a
   pre-existing install (e.g. a read-only symlink to `node_modules`).
4. **Keep CLAUDE.md ≤ 200 lines.** With N parallel agents, every extra line in CLAUDE.md
   costs N times as many tokens per round-trip.
5. **Clean up worktrees after merge.** Stale worktrees accumulate disk usage and confuse
   `git worktree list`.

## Consequences

- A `worktrees/SKILL.md` skill will document the lifecycle (create → work → PR → remove)
  and the guardrails above.
- A `/parallel-task` command will provide a guided flow for decomposing a task into
  independent sub-tasks and spawning agents in separate worktrees.
- The `CLAUDE.md` 200-line limit (already enforced by `/new-project`) is elevated from a
  style preference to a resource constraint, especially relevant when parallel agents are used.
- Implementation is postponed until there is a concrete need for it in a real project.
  The skill and command will not be created speculatively.
