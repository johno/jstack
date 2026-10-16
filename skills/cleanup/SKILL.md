---
name: cleanup
description: Conservatively remove branches, worktrees, and related local development state after work has landed. Use when asked to prune, tidy, or clean up completed development work.
---

# Cleanup

Clean up completed development state without risking unmerged or uncommitted work.

Follow repository-local source-control conventions. When proof is ambiguous, keep the item and report why.

## 1. Refresh source-control state

Refresh remote references and repository metadata using the repository's normal source-control workflow before deciding what is safe to remove.

Inventory relevant:

- local branches
- remote branches when visible
- worktrees or equivalent secondary checkouts
- open reviewable changes associated with those branches
- uncommitted and untracked changes

Never treat stale local metadata as proof that work landed.

## 2. Prove a candidate is safe

A branch or checkout is a cleanup candidate only when you can establish that its useful work has already landed or is otherwise intentionally obsolete.

Acceptable evidence can include:

- the associated reviewable change is recorded as merged or landed
- all unique commits or changes are demonstrably present in the destination branch
- repository-specific stack/fold behavior proves the work was incorporated
- the user explicitly identifies the work as abandoned and asks to remove it

Do not rely only on a simple ancestor check when the repository's merge strategy can rewrite commits.

For remote branches, verify the remote state independently. Do not assume it still matches the local branch.

## 3. Exclude unsafe state

Never remove:

- the repository's primary branch
- the branch or checkout the current session is actively using
- a checkout with uncommitted or untracked work
- a branch with an open reviewable change
- a branch with unique work that is not proven to have landed
- a remote branch that has advanced beyond the local state
- anything whose status cannot be determined confidently

A newly created branch with no work is not automatically “merged”. Treat empty or ambiguous branches separately.

## 4. Remove in a safe order

When cleanup has been explicitly requested and the candidates are proven safe:

1. remove secondary checkouts or worktrees first
2. remove their local branches
3. remove remote branches only when repository policy allows it and their remote state was also proven safe
4. prune stale source-control metadata

Do not force-remove a dirty checkout or bypass source-control safety checks.

If a normal removal command refuses, investigate or skip the item rather than escalating immediately to a destructive force option.

## 5. Report

Summarize:

- what was removed
- what was kept
- why any ambiguous or unsafe item was skipped

A conservative cleanup that leaves uncertain state alone is successful.
