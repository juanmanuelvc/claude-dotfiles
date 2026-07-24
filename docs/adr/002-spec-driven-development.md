# ADR-002: Spec-Driven Development

**Status:** Deferred
**Date:** 2026-03-16

## Context

Spec-Driven Development (SDD) places a formal specification step before writing tests or code.
The specification becomes the source of truth from which tests are derived, and tests in turn
drive the implementation (composing with TDD).

Common forms:
- **OpenAPI/Swagger** — API contract defined before any endpoint is implemented.
- **BDD (Behaviour-Driven Development)** — human-readable Given/When/Then scenarios
  (e.g. via Cucumber, pytest-bdd) bridge product intent and test code.
- **Interface contracts** — types, function signatures, and error cases agreed upfront,
  before implementation begins.

The full flow would be: **Spec → Tests (from spec) → Implementation (TDD cycle)**.

## Decision

Not adopted at this time. The practice is unfamiliar and introducing it without hands-on
experience risks writing a workflow that does not reflect real usage.

TDD (`skills/tdd/SKILL.md`) is adopted instead as the baseline. It provides the
Red-Green-Refactor discipline without requiring a preceding spec phase. Goal
loops compose with TDD via done-when checks, not a formal SDD phase.

## Revisit when

- A project involves a public API or a contract shared between teams, where an OpenAPI spec
  would be a natural fit.
- A project has non-technical stakeholders who need to validate behaviour before code is
  written — BDD scenarios would bridge that gap.
- TDD alone proves insufficient for catching integration or contract mismatches.

## Consequences

- No spec-driven skill or command will be created until there is concrete experience with
  the practice in a real project.
- This ADR serves as a record of intent so the decision can be revisited without losing
  the reasoning.
