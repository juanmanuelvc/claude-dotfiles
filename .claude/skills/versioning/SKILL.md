---
name: versioning
description: Use this skill when bumping versions, generating or updating a CHANGELOG, tagging releases, or advising on semantic versioning for a project.
---

# Versioning

## Semantic Versioning (semver)

Format: `MAJOR.MINOR.PATCH`

| Bump | When |
|---|---|
| `MAJOR` | Breaking change — existing consumers must update their code |
| `MINOR` | New backwards-compatible feature |
| `PATCH` | Backwards-compatible bug fix or chore |

Pre-release: `1.0.0-alpha.1`, `2.0.0-rc.1`. Use sparingly.

A version of `0.x.y` signals the public API is not yet stable — breaking changes are allowed on `MINOR` bumps.

## Deciding the next version

Look at all commits since the last tag:
- Any `feat` → at least `MINOR` bump
- Any `!` suffix or `BREAKING CHANGE` footer → `MAJOR` bump
- Only `fix`, `chore`, `docs`, `refactor`, `test`, `perf` → `PATCH` bump

## Choosing a release tool

| Situation | Recommended tool |
|---|---|
| GitHub-hosted project with CI/CD | `release-please` (GitHub Action) |
| Personal repo, simple project, or no CI/CD | `git-cliff` (local CLI) |

---

## Option A — release-please (GitHub Action)

Best for projects that merge frequently and publish artifacts (packages, Docker images, APIs).

**How it works:**
1. On every merge to `main`, the action creates or updates a "Release PR" that bumps the version and drafts the changelog.
2. When you're ready to release, merge the Release PR — the action then creates the git tag and GitHub Release automatically.

**Setup** — create `.github/workflows/release-please.yml`:
```yaml
on:
  push:
    branches: [main]

permissions:
  contents: write
  pull-requests: write

jobs:
  release-please:
    runs-on: ubuntu-latest
    steps:
      - uses: googleapis/release-please-action@v4
        with:
          release-type: node   # or: python, go, rust, simple …
```

No local tools required. Everything happens in CI.

---

## Option B — git-cliff (local CLI)

Best for personal repos, infrequent releases, or projects without CI/CD.

**Requires:** `git-cliff` installed — ask the user to install it if not available. See https://git-cliff.org/docs/installation for instructions.

**Release workflow:**
```bash
# 1. Preview what will go in the changelog
git cliff --unreleased

# 2. Generate/update CHANGELOG.md and decide the tag
git cliff --tag v1.2.0 -o CHANGELOG.md

# 3. Commit and tag
git add CHANGELOG.md
git commit -m "chore: release v1.2.0"
git tag v1.2.0
git push origin main v1.2.0
```

---

## Rules (both tools)

- Never skip a version number.
- Tags are immutable — do not move or delete a published tag.
- `CHANGELOG.md` is always committed in the same commit as the version bump, never separately.
- `0.0.x` versions are reserved for initial unstable work before the first real release.
