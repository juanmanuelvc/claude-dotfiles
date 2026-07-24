# Global Instructions

## Project Identity
- Main stack: adapt per project (TypeScript / Python / etc.)
- Package manager: adapt per project (pnpm / uv / npm / pip)
- Branch convention: `feat/`, `fix/`, `chore/`, `docs/` (or `goal/<slug>` for autonomous goals)

## Code Style
- Prefer explicit code over cleverness.
- Always add types/annotations when the language supports it.
- Write tests before or alongside new logic.
- Use descriptive names; avoid abbreviations.
- Minimum necessary complexity — three similar lines beats a premature abstraction.
- No backwards-compatibility shims for code you are certain is unused; delete it.

## Agent Behaviour
- Ask before making large, destructive, or irreversible changes.
- Prefer concise, direct explanations — skip filler phrases.
- On errors, show the root cause before proposing a fix.
- Never skip hooks (`--no-verify`) or force-push without explicit permission.
- For multi-step autonomous work, load the `goal` skill and follow it end-to-end.
- When a long session must pause, run the `handoff` prompt before starting a fresh context.

## Git Guardrails
- `main` is protected: never commit, push, merge, or rebase onto `main`.
- One task or goal → one short-lived branch cut from up-to-date `origin/main`.
- No shared long-lived `develop` / `agent` playground branches.
- Prefer a git worktree for multi-step or long-running goals.
- Pushing the **goal/feature branch** is allowed; opening a PR to `main` requires explicit user confirmation (`open-pr` skill).
- Merge to `main` is human-owned (GitHub PR + branch protection).

## Commits
- Conventional Commits: `type(scope): imperative description` — one-liner only unless asked.
- **No `Co-Authored-By` trailer** — ever.
- Stage specific files — never `git add -A` blindly.
- Full staging/review steps: load the `commit` prompt.

## Security
- Never commit secrets, credentials, `.env` files, or tokens.
- Validate at system boundaries (user input, external APIs); trust internal guarantees.
- Do not introduce command injection, XSS, SQL injection, or other OWASP top-10 issues.

## Observability
- Prefer structured logs with enough context to diagnose failures.
- Prefer worktrees or separate sessions over polluting the primary checkout with long monitors.

## Project Quality Gates
- If `templates/AGENTS.md` was modified, bump the `template-version` marker and add a `CHANGELOG.md` entry on the release branch.

## Available Skills
<!-- Scan this list at the start of any non-trivial task and load relevant skills before acting. -->

| Skill | When to load |
|---|---|
| `skills/goal/SKILL.md` | Multi-step autonomous work with a measurable done-when condition |
| `skills/git-workflow/SKILL.md` | Branch, worktree, rebase, conflict, or merge-prep operations |
| `prompts/commit.md` | Staging and creating a commit |
| `skills/quality-gates/SKILL.md` | Before committing or opening a PR — tests, linter, type-checker |
| `skills/session/SKILL.md` | Context pressure, pause/resume, or delegating exploration |
| `skills/tdd/SKILL.md` | Writing new logic, fixing bugs, adding or modifying tests |
| `skills/open-pr/SKILL.md` | Only when the user explicitly asks to open a PR — never proactively |
| `skills/versioning/SKILL.md` | Bumping versions, changelogs with git-cliff, tagging releases |
