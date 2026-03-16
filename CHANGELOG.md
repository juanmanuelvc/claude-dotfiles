# Changelog

All notable changes to this repository are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Changelog is generated with [git-cliff](https://git-cliff.org) from conventional commits.

<!-- To generate/update: git cliff --tag vX.Y.Z -o CHANGELOG.md -->

## [Unreleased]

## [0.1.0] - 2026-03-16

### Added
- Initial dotfiles scaffold: commands, hooks, skills, and `settings.json`
- `scripts/install.sh` for one-time symlink setup into `~/.claude/`
- `templates/CLAUDE.md` as a per-project starter (versioned from this release)
- `/new-project` command — interactive greenfield scaffold with 200-line CLAUDE.md enforcement and auto skill extraction
- `/sync-claude-md` command — merge template updates into an existing project's CLAUDE.md
- Skills: `git-workflow`, `context-mgmt`, `tdd`, `open-pr`, `versioning`
- ADR-001: worktree parallel agent workflow (deferred)
- ADR-002: spec-driven development (deferred)
- Commit rules: one-liner only, no `Co-Authored-By`
- Skills table in CLAUDE.md with `When to load` guidance and scan-first instruction
