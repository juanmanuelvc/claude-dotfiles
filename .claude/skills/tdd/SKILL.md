---
name: tdd
description: Use this skill when writing new logic, fixing bugs, or refactoring — any time code correctness needs to be verified through tests.
---

# Test-Driven Development

## The cycle

1. **Red** — write a failing test that describes the desired behaviour. Run it and confirm it fails for the right reason.
2. **Green** — write the minimum code needed to make the test pass. No more.
3. **Refactor** — clean up the implementation without changing behaviour. Re-run tests after every change.

Never skip the Red step. A test that was never failing gives no confidence.

## What to test

- **Behaviour, not implementation.** Test what the code does, not how it does it.
- **One behaviour per test.** A test that asserts multiple unrelated things is harder to diagnose.
- **Edge cases explicitly.** Empty inputs, nulls, boundary values, error paths — each deserves its own test.
- **Do not test framework code** or third-party libraries; test your logic that uses them.

## Naming

Tests are documentation. Name them so a failing output reads like a sentence:

```
should return empty list when input is empty
throws InvalidArgumentError when price is negative
calculates total including tax for multiple items
```

## Before committing

```bash
# Run the full test suite — never commit with failing tests
<test command for this project>
```

## Refactoring rules

- Only refactor when all tests are green.
- Run tests after each small refactor step, not just at the end.
- If a refactor requires changing a test, stop — the design may be wrong.

## Red flags

- Writing tests after the implementation is done → you are writing confirmation tests, not specification tests.
- Mocking everything → the test may pass while the real integration is broken.
- Tests that are tightly coupled to private methods or internal state → they will break on every refactor.
