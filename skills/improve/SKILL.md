---
name: improve
description: Find and implement a meaningful, behavior-preserving improvement in an existing codebase. Use for refactoring, reducing technical debt, simplifying architecture, or improving maintainability.
---

# Improve

Make the codebase easier to understand, change, and maintain.

Find one worthwhile improvement, implement it, and verify it. Prefer removing complexity over moving it elsewhere.

Follow repository-local instructions and conventions.

## 1. Explore

Understand the codebase before proposing changes.

- Inspect the repository structure, architecture, and existing tests.
- Use source history to identify code that changes frequently or repeatedly changes together.
- Look for duplication, unnecessary indirection, excessive coupling, complicated control flow, dead code, and inconsistent implementations of the same concept.
- Trace relevant callers and dependencies to understand why the code exists.
- Consider whether the apparent complexity serves a legitimate purpose.

Focus on areas where complexity creates real maintenance costs. Don't inventory the entire repository unless necessary.

## 2. Choose

Identify a few concrete opportunities and select the most valuable one.

Prefer changes that:
- Make future changes simpler or safer.
- Remove unnecessary code, concepts, or dependencies.
- Address recurring friction rather than isolated ugliness.
- Have clear boundaries and can be verified independently.

Reject speculative abstractions, cosmetic rewrites, and changes whose benefits cannot be explained concretely.

If nothing is clearly worth improving, stop and explain why.

## 3. Improve

Make the smallest coherent change that addresses the problem.

- Understand existing behavior and contracts before editing.
- Preserve observable behavior, public interfaces, and compatibility.
- Add focused characterization tests when important behavior is not already protected.
- Reuse existing abstractions where appropriate.
- Avoid unrelated cleanup and unnecessary new abstractions.

If the improvement requires a substantial architectural decision or risky migration, describe the proposal rather than implementing it unilaterally.

## 4. Verify

Prove that the change is safe and worthwhile.

- Run relevant existing tests and repository checks.
- Inspect the final diff and affected callers.
- Check that behavior and contracts remain unchanged.
- Confirm the original source of complexity was actually reduced.
- Reconsider or revert changes that aren't demonstrably better.

Follow the repository's normal process for producing a reviewable change. Do not merge unless explicitly requested.

Summarize what was improved, why it matters, and how it was verified.

When asked only to identify opportunities, stop after exploration and selection without modifying code.
