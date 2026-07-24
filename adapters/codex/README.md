# Codex adapter

`scripts/install.sh` symlinks each skill into `~/.codex/skills/<name>`.

Codex reads project `AGENTS.md` natively. Use `prompts/goal.md` / the `goal`
skill for autonomous loops; Codex `/goal` remains available as a harness
feature — align done-when checks with this repo's goal contract format when
using both.
