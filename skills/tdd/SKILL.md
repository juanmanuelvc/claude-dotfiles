---
name: tdd
description: Use this skill when writing new logic, fixing bugs, or refactoring — any time code correctness needs to be verified through tests.
---

# Test-Driven Development

## The cycle

1. **Red** — write a failing test that describes the desired behaviour. Run it and confirm it fails for the right reason.
2. **Green** — write the minimum code needed to make the test pass. No more.
3. **Refactor** — clean up without changing behaviour. Re-run tests after every change.

Never skip the Red step. A test that was never failing gives no confidence.

## What to test

- **Behaviour, not implementation.**
- **One behaviour per test.**
- **Edge cases explicitly** — empty inputs, nulls, boundaries, error paths.
- **Do not test framework or third-party library internals**; test your logic that uses them.

## Naming

Name tests so a failure reads like a sentence:

```
should return empty list when input is empty
throws InvalidArgumentError when price is negative
calculates total including tax for multiple items
```

## Before committing

Run the full test suite (see Quality Commands in `AGENTS.md`). Never commit with failing tests.

## Refactoring rules

- Only refactor when all tests are green.
- Run tests after each small refactor step.
- If a refactor requires changing a test, stop — the design may be wrong.

## Red flags

- Tests written only after implementation → confirmation tests, not specification tests.
- Mocking everything → green tests with broken integration.
- Coupling to private methods / internal state → brittle under refactor.
