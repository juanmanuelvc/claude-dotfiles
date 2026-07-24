---
name: open-pr
description: Follow this skill when the user explicitly asks to open, create, or submit a pull request. NEVER invoke this skill proactively or as part of another task.
---

# Opening a Pull Request

**Only follow this skill when the user explicitly asks to open a PR. Never trigger it as a side-effect of other work.**

This is the only agent path onto `main` review — agents never merge.

## Steps

1. **Analyse all branch changes** against the base branch:
   ```bash
   git log <base>..HEAD --oneline
   git diff <base>...HEAD --stat
   ```

2. **Derive the PR title** from the overall intent of all commits — not just the latest.
   - Conventional Commits: `type: description`
   - Dominant type if mixed (`feat` > `fix` > `refactor` > `docs` > `chore`)
   - Under 70 characters

3. **Push** if the branch is not up to date with the remote:
   ```bash
   git push -u origin HEAD
   ```

4. **Show** the proposed title and body; wait for **explicit confirmation**. Do not open the PR until approved.

5. **Open** with `gh pr create` only after confirmation:
   - `--title`: from step 2
   - `--body`: structure below

## PR body structure

```markdown
## Summary
- <bullet per logical change group, not per commit>

## Test plan
- [ ] <one checkbox per thing the reviewer should verify manually>
```

Keep bullets concise. Do not list every commit individually.
