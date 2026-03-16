# Global Instructions

## Project Identity
- Main stack: adapt per project (TypeScript / Python / etc.)
- Package manager: adapt per project (pnpm / uv / npm / pip)
- Branch convention: `feat/`, `fix/`, `chore/`, `docs/`

## Code Style
- Prefer explicit code over cleverness.
- Always add types/annotations when the language supports it.
- Write tests before or alongside new logic.
- Use descriptive names; avoid abbreviations.
- Minimum necessary complexity — three similar lines beats a premature abstraction.
- No backwards-compatibility shims for code you are certain is unused; delete it.

## Agent Behaviour
- Ask before making large, destructive, or irreversible changes.
- Use `ultrathink` for complex tasks or when self-reviewing your own changes.
- When context reaches ~60%, warn me and suggest `/handoff` before continuing.
- Prefer concise, direct explanations — skip filler phrases.
- On errors, show the root cause before proposing a fix.
- Never skip hooks (`--no-verify`) or force-push without explicit permission.

## Commits
- Follow Conventional Commits: `type(scope): imperative description`
- Common types: `feat`, `fix`, `chore`, `docs`, `refactor`, `test`
- **One-liner only** — no multi-line body unless explicitly requested.
- **No `Co-Authored-By` trailer** — ever.
- Stage specific files — never `git add -A` blindly.
- Review `git diff --staged` before committing.

## Security
- Never commit secrets, credentials, `.env` files, or tokens.
- Validate at system boundaries (user input, external APIs); trust internal guarantees.
- Do not introduce command injection, XSS, SQL injection, or other OWASP top-10 issues.

## Observability
- Use background agents to monitor logs or long-running processes.
- Prefer structured logs with enough context to diagnose failures.

## Available Skills
<!-- Load on demand — only costs tokens when activated -->
- `.claude/skills/git-workflow/SKILL.md`   — branch flow, semantic commits, PRs, conflicts
- `.claude/skills/context-mgmt/SKILL.md`   — when and how to compact / hand off context
