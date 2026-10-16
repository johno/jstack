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

jstack describes **what good work looks like**, not how your agent harness happens to do it.

Your repo owns the details:

- commands
- issue tracking
- branching
- testing
- review
- merging

jstack owns the workflow.

That means the same skill should work whether a repo uses Linear or GitHub Issues, Bun or pnpm, stacked PRs or a single branch.

No router. No model selection. No runtime. No swarm.

Just Markdown.

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

Use all of them or copy the ones you want.

## Development

Check the skills:

```sh
scripts/check-skills.sh
```

The check validates the basic Agent Skills format and catches obvious harness-specific assumptions sneaking into the portable skills.

## License

MIT

Crafted with <3 by [John Otander](https://johno.com).
