---
name: ship
description: Verify that a change is genuinely ready to land, then merge or otherwise ship it using repository-local policy and close out the associated work. Use when asked to merge, land, ship, or finalize an implemented change.
---

# Ship

Treat shipping as an irreversible boundary.

Do not land a change until the evidence says it is ready. Follow repository-local policy for required checks, approvals, merge strategy, deployment, release, and issue tracking.

## 1. Identify exactly what is shipping

Resolve the change or set of dependent changes being asked to land.

- Confirm the intended work item and reviewable change correspond to each other.
- For multiple dependent changes, understand their order and whether repository policy expects them to land together or separately.
- Make sure you are checking the current revision, not a stale commit or earlier review.
- Read the final diff and the user-visible or system-visible outcome one more time.

Do not accidentally ship adjacent open work.

## 2. Verify the current revision

Check the repository's required evidence for the exact revision that will land.

When applicable, verify:

- the automated checks the repository expects for this change are passing
- relevant tests cover the changed behavior
- static analysis and build checks pass
- migrations, generated artifacts, or deployment prerequisites are accounted for
- required human or automated review has happened on the current revision
- material review findings are fixed or explicitly resolved with evidence
- no requested changes or known release blockers remain
- documentation and compatibility notes required by the change are present

If hosted checks could not run for an infrastructure reason, use a documented local equivalent only when repository policy permits it, and record what was actually run on the reviewable change.

Never reinterpret a real failing check as an infrastructure failure just to unblock shipping.

## 3. Reassess material risk

Before landing, look specifically for reasons the change should still wait:

- unresolved correctness or security concerns
- unverified destructive behavior
- data migration or rollback risk
- compatibility breaks outside the stated scope
- dependent changes that have not landed
- review feedback that applies to the current revision but was never addressed
- verification that was claimed but not actually performed

Do not block shipping for unrelated cleanup, hypothetical perfection, or review noise. Capture legitimate follow-up work separately when repository policy supports it.

## 4. Land using repository policy

Use the repository's documented merge or shipping mechanism.

If repository policy reserves landing for a person or another process, stop at a ready verdict and report the exact state instead of landing.

Do not invent a merge strategy, rewrite shared history beyond what repository policy allows, bypass branch protection, skip required approvals, or disable checks to force the change through.

For a set of dependent changes, preserve the repository's intended order and atomicity guarantees.

If the shipping mechanism rejects the change, stop and fix the cause rather than routing around the guardrail.

## 5. Close out

After the change has actually landed:

- verify the repository reports it as landed
- confirm the destination branch is still healthy when the repository has checks for it
- distinguish integrating a change from releasing it, and report which boundary was crossed and what promotion remains
- update the associated work item according to repository policy
- close only the work that is truly complete
- record any intentionally deferred follow-up in the normal tracker when available
- report what shipped and any remaining operational follow-up

Do not mark work complete merely because a merge was attempted.
