---
name: review
description: Review a code change for material correctness, reliability, security, architecture, and maintainability problems while aggressively suppressing speculative or low-value findings. Use for pull requests, diffs, patches, or pre-ship review.
---

# Review

Review the change with a precision-first standard: finding no problems is better than inventing weak ones.

The purpose of review is to identify issues that are worth changing before the work ships, not to demonstrate that the reviewer inspected every line.

Follow repository-local review policy and architecture guidance when present.

## 1. Understand the change

Before looking for defects:

- Read the change description, linked work item, and relevant repository instructions.
- Understand the intended behavior and boundaries of the change.
- Inspect the diff and enough surrounding code to understand the execution path.
- Read relevant tests and existing abstractions.
- Distinguish behavior introduced by this change from pre-existing behavior.

Do not review a patch as isolated text when the repository provides the context needed to understand it.

## 2. Generate candidate findings

Look for concrete problems in areas such as:

- incorrect behavior
- broken failure handling
- data loss or corruption
- security or authorization mistakes
- race conditions or invalid state transitions
- API or compatibility regressions
- incorrect assumptions about callers, data, or lifecycle
- missing verification for material behavior
- architectural duplication that creates a real maintenance or correctness problem

A candidate is not yet a finding.

## 3. Try to disprove every candidate

Before reporting a concern, ask:

1. **Is the affected path real?** Can the code actually reach the state or call path being described?
2. **Is it relevant to this change?** Was it introduced, exposed, or made materially worse here?
3. **Is the failure plausible?** Can the triggering condition exist under the system's actual contracts?
4. **Is the impact material?** Would a user, operator, maintainer, or dependent system meaningfully care?
5. **Is the fix actionable?** Is there a concrete correction that belongs in this change?

Inspect more code when one of these questions can be answered from the repository.

Suppress the candidate when the evidence does not survive this check.

## 4. Reject review noise

Do not report:

- purely stylistic preferences already accepted by the codebase
- hypothetical misuse that violates an enforced contract
- unrelated pre-existing problems
- vague “could be cleaner” suggestions
- speculative performance concerns without a plausible hot path
- requests for abstractions with no demonstrated second use
- defensive checks for states the type system or validated boundary makes impossible
- duplicate symptoms caused by one root issue
- test requests that do not protect material behavior
- observations that are true but do not justify changing the patch

Do not lower the bar merely to produce a requested number of findings.

## 5. Report only surviving findings

Group findings that share one root cause.

For each finding include:

- **Location** — the smallest useful file/function/line reference
- **Problem** — what is wrong
- **Evidence** — the concrete execution path, contract, or repository fact that proves it
- **Impact** — what can fail and why it matters
- **Fix direction** — the smallest reasonable correction, without rewriting the implementation for the author

Use severity only to communicate impact, not confidence:

- **critical** — unsafe to ship; severe security, data, availability, or broadly broken behavior
- **major** — a real correctness or reliability defect that should be fixed before shipping
- **minor** — limited impact but still clearly worth fixing in this change

If a concern is uncertain, investigate it. Do not disguise uncertainty with a severity label.

## 6. Conclude cleanly

If no candidate survives verification, say that there are no material findings.

A short clean review is a successful outcome.
