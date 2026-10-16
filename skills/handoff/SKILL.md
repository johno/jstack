---
name: handoff
description: Compress active engineering work into a factual continuation brief so another agent, engineer, or session can resume safely. Use before switching sessions, changing owners, pausing unfinished work, or handing a task to another implementation agent.
---

# Handoff

Create the smallest continuation brief that lets someone resume the work without reconstructing the full conversation.

Prefer repository facts, decisions, file paths, commands, and observed results over narrative history.

## 1. Re-read the current state

Before writing the handoff, inspect the current work rather than relying only on memory.

When available, check:

- the work item and its latest comments
- current branch or change state
- who currently owns the work, including any other session or person actively using the same branch or checkout
- modified files and final diff
- test, build, and review status
- unresolved errors or blockers
- repository instructions relevant to the next step

Do not claim work is complete, tested, reviewed, committed, pushed, or merged unless the current state proves it.

## 2. Preserve decisions, not the whole discussion

Capture decisions that constrain future work:

- the goal and intended behavior
- important architecture or API choices
- alternatives explicitly rejected and why
- compatibility, migration, rollout, or product constraints
- assumptions that still need verification

Omit abandoned brainstorming unless the reason for rejecting it matters to the next person.

## 3. Write the continuation brief

Use this shape unless repository policy defines another handoff format:

### Goal

One short paragraph describing the outcome being pursued.

### Current state

What has actually been completed and where the work currently sits.

### Decisions

Only decisions that materially constrain the remaining implementation.

### Relevant files

The smallest useful set of file paths, symbols, work items, or review links needed to re-enter the work.

### Verification

Commands or checks that were run and their observed result. List important checks that still need to run.

### Remaining work

Concrete unfinished steps, ordered when dependencies matter.

### Risks or blockers

Known failures, unresolved questions, external dependencies, or traps the next person should not rediscover.

### Next action

The single best first action for the next session.

## 4. Make it durable when useful

If the repository or work tracker has a designated place for handoff notes, save the brief there when the capability is available.

Otherwise return the brief directly.

Keep the handoff factual and concise. Do not dump the conversation transcript, chain of thought, or long speculative analysis.
