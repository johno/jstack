# jstack

A tiny, portable stack of engineering skills for coding agents.

jstack helps an agent take software work from an idea to a landed change without trying to become the agent harness itself.

## The stack

- **ticket** — turn context into an executable work item
- **pickup** — implement an existing work item and leave it merge-ready
- **review** — find material problems and suppress speculative review noise
- **ship** — verify the irreversible boundary and land the change safely
- **handoff** — compress active work so another agent or session can continue
- **cleanup** — conservatively remove branches and worktrees after work lands

## What jstack is not

jstack is not:

- a model router
- an MCP bundle
- an agent runtime
- a swarm or subagent framework
- a replacement for repository instructions
- a package-manager or CI abstraction
- a giant catalog of personal utilities

The skills describe engineering workflows. The harness supplies capabilities.

## Repository policy wins

A repository's own instructions define concrete policy: its issue tracker, commands, branching model, code style, review process, and merge strategy.

jstack should follow those instructions rather than hard-coding alternatives.

For example, a jstack skill may say:

> Run the repository's documented verification commands.

The repository may define that as `make ci`, `bun test`, `pnpm test`, or something else entirely.

A jstack skill may say:

> Update the referenced work item.

The repository may use Linear, GitHub Issues, Jira, or no tracker at all.

This separation is intentional:

```text
jstack skill          repository policy
----------------      -----------------------------
what to accomplish    how this repository does it
review the change     which review bot/process
verify the change     exact test/lint/typecheck commands
land the change       merge/rebase/stack conventions
update the work       Linear/GitHub/Jira conventions
```

## Portability rules

Core skills must not require:

* a particular agent harness
* harness-specific invocation syntax
* named models or model routing
* MCP function names
* a particular issue tracker or source host
* subagents, parallelism, or swarms
* a specific package manager, test runner, CI provider, or merge strategy
* project-specific ticket prefixes, branch names, commands, or bots

Skills may use capabilities when they are available, but must still make sense when the capability has a different implementation.

## Skill format

Each skill lives at:

```text
skills/<name>/SKILL.md
```

and uses portable Agent Skills metadata:

```yaml
---
name: example
description: What the skill does and when to use it.
---
```

Keep the body procedural, concise, and self-contained. Prefer evidence and concrete verification over elaborate process.

## Development

Check every skill's metadata and scan for obvious portability regressions:

```sh
scripts/check-skills.sh
```

The script needs only a POSIX shell, `sed`, `awk`, and `grep`. It verifies that each `skills/<name>/SKILL.md` has closed frontmatter with only portable keys, a `name` that matches its directory, a `description` that says when to use the skill, and a non-empty body. It also flags harness-, tracker-, host-, model-, and project-specific terms such as `$ARGUMENTS`, MCP function names, `gh` commands, and `make` targets.

A flagged term is a prompt to fix the wording, not to add an exception. Move concrete policy into the consuming repository's instructions.

## Design principle

jstack should teach behavior, not provide orchestration.

If a proposed feature needs a global mode, model routing, a task graph, a daemon, or a harness API, it probably belongs somewhere else.
