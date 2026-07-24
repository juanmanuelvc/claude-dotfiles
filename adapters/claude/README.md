# Claude Code adapter (legacy)

This repository no longer targets Claude Code as a first-class harness.

`settings.json.legacy` is the previous Claude Code hooks file, kept only for
reference. It is **not** installed by `scripts/install.sh`.

If you still use Claude Code occasionally:
- Point it at `AGENTS.md` (Claude can fall back to / import AGENTS.md).
- Prefer `~/.agents/skills` content over `~/.claude/skills` hooks.
- Do not re-enable the old UserPromptSubmit skill-spam hooks.
