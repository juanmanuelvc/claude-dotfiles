# Cursor adapter

Cursor already discovers global skills from `~/.agents/skills/` (same as the
portable core install). No extra skill symlinks are required.

`scripts/install.sh` also links `prompts/*.md` into `~/.cursor/commands/` so
prompts are invokable as Cursor commands.

Optional: keep Cursor user rules as **thin safety** only (no force-push,
confirm before PR). Prefer this repo's skills/prompts for full procedures to
avoid double-injecting commit/PR policy.
