---
name: ticket
description: Turn a request, bug, idea, or discovered follow-up into a clear, executable work item. Use when work should be captured for later implementation or handed to another engineer or agent.
---

# Ticket

Turn the current context into a work item that can be picked up without reconstructing the conversation.

Follow repository-local instructions for the issue tracker, project, labels, ownership, and ticket format when they exist.

## 1. Gather evidence

Before writing the work item:

- Understand the desired outcome and why it matters.
- Inspect the relevant code, tests, documentation, configuration, or runtime behavior when available.
- Search for existing work that may already cover the same problem. Make sure the available tracker is the one this repository actually uses, for example by checking that its identifiers match those the repository references.
- For a bug, capture the observed behavior, expected behavior, reproduction path, and exact errors when they are available.
- Distinguish facts you verified from assumptions or proposed implementation.

Do not invent implementation details just to make the ticket look complete.

## 2. Define the smallest useful scope

Describe the smallest outcome that solves the problem.

- Keep unrelated cleanup out of scope.
- Separate independent follow-ups rather than growing one ticket indefinitely.
- Call out real dependencies or blockers.
- Preserve important product, compatibility, migration, or rollout constraints from the source context.
- If the implementation is uncertain, describe the decision that must be made instead of pretending it is settled.

## 3. Write for the implementer

Use the repository's preferred ticket template when one exists. Otherwise use this shape:

### Context

What is wrong, missing, or desired, and why it matters.

### Scope

What this work should change. Be concrete about behavior and boundaries.

### Implementation notes

Verified code locations, existing abstractions to reuse, constraints, likely approach, and known edge cases. Treat this as guidance, not a speculative rewrite of the codebase.

### Done when

A short checklist of observable outcomes that prove the work is complete.

Include reproduction or verification steps when they materially reduce ambiguity.

## 4. Create or return the work item

If an issue-tracking capability is configured for the repository, create or update the work item there and preserve the repository's normal metadata conventions. Link related or blocking work when it exists.

New work items often notify people. Unless repository instructions say to file directly, confirm the title and placement with the user before creating one. After creating it, check that the saved fields match what you intended.

If no tracker is available, return issue-ready Markdown that can be pasted into one.

Use a short title that describes the outcome in plain language. Do not add process noise, agent attribution, or speculative follow-up work.
