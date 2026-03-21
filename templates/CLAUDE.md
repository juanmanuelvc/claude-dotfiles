[//]: # (template-version: v0.3.0)
# Project Instructions

## Project Identity
- Main stack: <!-- e.g. TypeScript, Python -->
- Package manager: <!-- e.g. pnpm, uv, npm, pip -->
- Branch convention: `feat/`, `fix/`, `chore/`, `docs/`

<!-- If stack is not yet defined, run /new-project to scaffold the project interactively.
     Do not assume a stack — ask the user before creating any files. -->

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
- When all tasks for a branch are complete, remind the user about `/pr-preview`.

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
<!-- Scan this list at the start of any non-trivial task and load relevant skills before acting. -->

| Skill | When to load |
|---|---|
| `~/.claude/skills/git-workflow/SKILL.md` | Any git operation: branch, PR, merge, rebase, conflict |
| `~/.claude/commands/commit.md` | Quick standalone commits — source of truth for commit conventions |
| `~/.claude/skills/quality-gates/SKILL.md` | Before committing or opening a PR — runs tests, linter, type-checker |
| `~/.claude/skills/context-mgmt/SKILL.md` | Context bar ~60%, before `/compact` or `/clear`, delegating to sub-agents |
| `~/.claude/skills/tdd/SKILL.md` | Writing new logic, fixing bugs, adding or modifying tests |
| `~/.claude/skills/open-pr/SKILL.md` | Only when the user explicitly asks to open a PR — never proactively |
| `~/.claude/skills/versioning/SKILL.md` | Bumping versions, generating changelogs with git-cliff, tagging releases |
