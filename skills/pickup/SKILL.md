---
name: pickup
description: Implement an existing work item from context gathering through a verified, merge-ready change. Use when asked to pick up, start, continue, or implement a ticket, issue, task, or clearly defined unit of work.
---

# Pickup

Implement the referenced work item and leave the change merge-ready.

Do not merge or land the change as part of this skill unless the user explicitly asks for that separately. Respect repository-local instructions for branching, issue tracking, verification, review, and pull requests.

## 1. Reconstruct the work

Read the work item and the context around it before changing code.

- Read its description, comments, related work, blockers, and sub-tasks when available.
- Read repository instructions and the code, tests, documentation, and configuration the change touches.
- Reconcile the work item with the current repository state. Tickets can be stale.
- Identify the user-visible or system-visible outcome the work is actually trying to produce.
- Preserve explicit constraints, but do not blindly preserve implementation suggestions that no longer fit the code.

If something is ambiguous, prefer the smallest interpretation consistent with the stated outcome and existing architecture. Surface a blocking ambiguity rather than silently inventing product behavior.

## 2. Plan the smallest sufficient change

Form a short implementation plan grounded in the code you inspected.

- Reuse existing abstractions before creating new ones.
- Keep unrelated refactors and cleanup out of scope.
- Split work only when the pieces are independently understandable and reviewable.
- Follow the repository's existing branch or stacked-change conventions rather than imposing one.
- Identify the verification that will prove the change works before implementation begins.

Update the work item with material discoveries when an issue-tracking capability is available and repository policy expects it.

## 3. Implement

Make the smallest coherent change that satisfies the work item.

- Follow local architecture, naming, typing, state-management, and testing conventions.
- Change tests and documentation with the behavior they describe.
- Cover important failure paths and boundary conditions, not only the happy path.
- Avoid compatibility layers, abstractions, or configurability that the requirement does not need.
- Do not modify unrelated files just because you noticed them.

When the current design makes the requested change awkward, fix the relevant design problem rather than layering a brittle workaround on top of it.

## 4. Verify

Run the narrowest useful checks first, then the repository's documented broader verification before declaring the change ready.

Verification should normally include, when applicable:

- tests for the changed behavior
- static analysis such as type checking or linting
- build or compile checks
- integration or end-to-end coverage for behavior that crosses boundaries
- direct inspection of generated output, UI, API responses, migrations, or other artifacts when tests alone are insufficient

Inspect the final diff yourself. Look for accidental scope growth, stale code, missing failure handling, and mismatches between implementation and tests.

If a check cannot be run, say exactly which check and why. Do not describe unrun verification as passing.

## 5. Make it review-ready

Create or update the repository's normal reviewable change when that capability is available.

The review context should make clear:

- what changed
- why this approach fits the existing system
- how it was verified
- any intentionally deferred work or known limitation

Use the repository's configured review process when one exists. Address substantiated findings with code or evidence. Do not expand the change for speculative, stylistic, or unrelated review suggestions.

Keep the work item current and link the change when repository policy expects it.

## 6. Stop at merge-ready

Finish with:

- a clean, coherent diff
- completed applicable verification
- material review findings addressed
- the work item and review context current
- a concise account of anything that still blocks shipping

Do not merge merely because implementation is complete. Shipping is a separate decision boundary.
