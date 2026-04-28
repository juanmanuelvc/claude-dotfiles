# Changelog

All notable changes to this repository are documented here.
Format follows [Keep a Changelog](https://keepachangelog.com/en/1.0.0/).
Versioning follows [Semantic Versioning](https://semver.org/spec/v2.0.0.html).
Changelog is generated with [git-cliff](https://git-cliff.org) from conventional commits.

<!-- To generate/update: git cliff --tag vX.Y.Z --unreleased --prepend CHANGELOG.md -->

## [0.4.0] - 2026-04-28

### 🚀 Features

- Set up git-cliff as default versioning tool with CI automation
- Move scratchpad to shared sibling repo and bump template to v0.4.0 (#5)

### 🐛 Bug Fixes

- *(changelog)* Push to default branch to avoid detached HEAD failure

### 📚 Documentation

- Add attribution link for Sankalp's Claude Code article

### ⚙️ Miscellaneous Tasks

- Prep repo for public release
- Prep repo for public release

## [0.3.0] - 2026-03-21

### Changed
- `versioning` skill: git-cliff is now the default for all projects; release-please reserved for artifact-publishing projects
- `new-project` command: scaffolds git-cliff (`cliff.toml` + changelog workflow) instead of release-please
- `templates/CLAUDE.md`: versioning skill row updated to mention git-cliff

### Added
- `cliff.toml` — git-cliff configuration for this repo (default settings)
- `.github/workflows/changelog.yml` — auto-regenerates CHANGELOG.md on version tag push
- `templates/changelog.yml` — changelog workflow template for new projects

## [0.2.0] - 2026-03-19

### Added
- `/commit` command — source of truth for commit conventions and staging/review workflow
- `/pr-preview` command — full pre-PR pipeline: review, simplify, quality gates, commit, open PR
- `quality-gates` skill — runs project's test/lint/type-check commands defined in CLAUDE.md
- Project quality gate in CLAUDE.md: enforce template version bump when `templates/CLAUDE.md` changes

### Changed
- `git-workflow` skill: adopted trunk-based development model (no persistent integration branch); branch naming updated to `type/scope/slug`; commit conventions and workflow delegated to `/commit`
- `templates/CLAUDE.md`: added `/pr-preview` reminder to Agent Behaviour; added `commit` and `quality-gates` entries to skills table
- `CLAUDE.md`: same updates as template

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
