#!/bin/sh
# Check skills/*/SKILL.md for valid portable metadata and obvious portability regressions.
# Usage: scripts/check-skills.sh [skills-dir]

set -u

root=${1:-skills}
status=0
names=""

fail() {
  echo "$1: $2"
  status=1
}

# Boundaries that work in both GNU and BSD grep -E.
B='(^|[^A-Za-z0-9_])'
E='([^A-Za-z0-9_]|$)'

# pattern#reason
lint_rules="\\\$ARGUMENTS#harness-specific argument placeholder
${B}(Task|Agent|TodoWrite)\\(#harness-specific tool invocation
${B}(subagents?|swarms?)${E}#requires subagents or swarms
${B}(Claude|CLAUDE|Cursor|Codex|Copilot)${E}#names a specific agent harness
${B}(Opus|Sonnet|Haiku|GPT-?[0-9]|Gemini)${E}#names a specific model
mcp__#MCP function name
${B}MCP${E}#requires MCP
${B}Linear${E}#requires a specific issue tracker
${B}[A-Z][A-Z0-9]+-[0-9]+${E}#project-specific ticket identifier
${B}gh (stack|pr|issue|run|api)${E}#GitHub CLI command
${B}GitHub( Actions)?${E}#requires a specific source host or CI provider
(\`|^[[:space:]]*)make [a-z]#project-specific make target
${B}(npm|npx|pnpm|yarn|bun|bunx) [a-z]#project-specific package-manager command
${B}--(rebase|squash)${E}#hard-coded merge strategy"

for file in "$root"/*/SKILL.md; do
  [ -f "$file" ] || { fail "$root" "no skills found"; break; }
  dir=$(basename "$(dirname "$file")")

  if [ "$(sed -n 1p "$file")" != "---" ]; then
    fail "$file" "must start with '---' frontmatter"
    continue
  fi

  close=$(awk 'NR > 1 && $0 == "---" { print NR; exit }' "$file")
  if [ -z "$close" ]; then
    fail "$file" "frontmatter is not closed with '---'"
    continue
  fi

  frontmatter=$(sed -n "2,$((close - 1))p" "$file")

  printf "%s\n" "$frontmatter" | awk -F: '/^[A-Za-z_-]+:/ { print $1 }' | while read -r key; do
    case $key in
      name | description | license | compatibility | metadata) ;;
      *) echo "$file: frontmatter key '$key' is not portable Agent Skills metadata" ;;
    esac
  done | grep . && status=1

  name=$(printf "%s\n" "$frontmatter" | sed -n 's/^name:[[:space:]]*//p')
  description=$(printf "%s\n" "$frontmatter" | sed -n 's/^description:[[:space:]]*//p')

  if [ -z "$name" ]; then
    fail "$file" "missing 'name'"
  else
    [ "$name" = "$dir" ] || fail "$file" "name '$name' does not match directory '$dir'"
    printf "%s\n" "$name" | grep -Eq '^[a-z0-9]+(-[a-z0-9]+)*$' || fail "$file" "name '$name' must be lowercase letters, digits, and single hyphens"
    [ ${#name} -le 64 ] || fail "$file" "name is longer than 64 characters"
    case " $names " in
      *" $name "*) fail "$file" "duplicate skill name '$name'" ;;
    esac
    names="$names $name"
  fi

  if [ -z "$description" ]; then
    fail "$file" "missing 'description'"
  else
    [ ${#description} -le 1024 ] || fail "$file" "description is longer than 1024 characters"
    printf "%s\n" "$description" | grep -Eq "${B}Use${E}" || fail "$file" "description should say when to use the skill (e.g. 'Use when ...')"
  fi

  sed -n "$((close + 1)),\$p" "$file" | grep -q '[^[:space:]]' || fail "$file" "Markdown body is empty"

  printf "%s\n" "$lint_rules" | while IFS="#" read -r pattern reason; do
    grep -nE "$pattern" "$file" | while IFS= read -r hit; do
      echo "$file:${hit%%:*}: $reason: ${hit#*:}"
    done
  done | grep . && status=1
done

[ $status -eq 0 ] && echo "All skills passed."
exit $status
