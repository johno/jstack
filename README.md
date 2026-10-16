# jstack

A tiny stack of skills for shipping software with coding agents.

jstack is a small collection of portable [Agent Skills](https://agentskills.io/) for the boring, important parts of writing software.

## Skills

- **ticket** — turn an idea into something another agent can pick up
- **pickup** — understand the work, implement it, verify it, get it review-ready
- **review** — find real problems without inventing fake ones
- **ship** — make sure the work is ready, then land it
- **handoff** — leave enough context for someone else to keep going
- **cleanup** — clean up branches and worktrees without deleting anything important

That's the stack.

## Philosophy

jstack describes **what good work looks like**, while your repo defines how that work gets done.

Your repo owns the details: how work is tracked, which commands to run, how branches and PRs are managed, and what needs to pass before something ships. jstack defines the workflow around those choices without depending on any of them.

The same `pickup` skill should work in a repo using Linear, Bun, and stacked PRs as it does in one using GitHub Issues, pnpm, and a single branch. There shouldn't need to be separate Claude, Codex, or Cursor versions.

The skills are plain Markdown and meant to stay portable. If jstack starts needing its own runtime, router, model selection, or orchestration layer, it's probably solving the wrong problem.

## Install

Install the stack:

```sh
npx skills add johno/jstack
```

Or grab an individual skill:

```sh
npx skills add johno/jstack --skill review
```

## Structure

```text
skills/
  ticket/SKILL.md
  pickup/SKILL.md
  review/SKILL.md
  ship/SKILL.md
  handoff/SKILL.md
  cleanup/SKILL.md
```

Each skill stands on its own, so you can use the whole stack or only the pieces that fit your workflow.

## Development

Run the checks with:

```sh
scripts/check-skills.sh
```

This validates the Agent Skills structure and flags obvious repo- or harness-specific assumptions that have leaked into the portable skills.

## License

MIT

Crafted with <3 by [John Otander](https://johno.com).
