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

jstack describes **what good work looks like**, while your repo defines the tools and conventions used to get there.

Your repo still owns the details: how you track work, which commands to run, how branches and PRs are managed, what needs to pass before something ships. jstack is meant to sit one level above that and describe the workflow without coupling it to any of those choices.

The same `pickup` skill should be useful in a repo using Linear, Bun, and stacked PRs as it is in one using GitHub Issues, pnpm, and a single branch. There shouldn't need to be separate Claude, Codex, or Cursor versions either.

The skills are intentionally just Markdown. If jstack starts needing a router, runtime, model selection, or its own orchestration layer, we've probably gone too far.

## Install

Install the stack:

```sh
npx skills add johno/jstack
```

Or grab just the skills you want:

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

Each skill is standalone, so there's nothing special about using the whole set together.

## Development

Run the checks with:

```sh
scripts/check-skills.sh
```

This validates the basic Agent Skills structure and catches some of the easy ways harness- or repo-specific assumptions can sneak into the skills.

## License

MIT

Crafted with <3 by [John Otander](https://johno.com).
