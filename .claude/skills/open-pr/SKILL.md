---
name: open-pr
description: Follow this skill when the user explicitly asks to open, create, or submit a pull request. NEVER invoke this skill proactively or as part of another task.
---

# Opening a Pull Request

**Only follow this skill when the user explicitly asks to open a PR. Never trigger it as a side-effect of other work.**

## Steps

1. **Analyse all branch changes** against the base branch:
   ```bash
   git log <base>..HEAD --oneline
   git diff <base>...HEAD --stat
   ```

2. **Derive the PR title** from the overall intent of all commits combined — not just the latest one.
   - Use Conventional Commits format: `type: description`
   - If the branch introduces multiple types of change, pick the dominant one (`feat` > `fix` > `refactor` > `docs` > `chore`)
   - Keep it under 70 characters

3. **Push the branch** if not already up-to-date with the remote:
   ```bash
   git push origin <branch>
   ```

4. **Open the PR** with `gh pr create`:
   - `--title`: the title derived in step 2
   - `--body`: structured body with the sections below

## PR body structure

```markdown
## Summary
- <bullet per logical change group, not per commit>

## Test plan
- [ ] <one checkbox per thing the reviewer should verify manually>
```

Keep bullets concise. Group related commits into a single bullet. Do not list every commit individually.
