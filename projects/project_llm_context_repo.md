---
name: llm-context repo
description: GitHub repo that syncs Claude memories, projects, ideas, rules, and code examples every 4 hours for cross-LLM use
type: project
---

A persistent context repo lives at https://github.com/lrshaid/llm-context (account: lrshaid).

Local path: `/Users/lautaro.rshaid/llm-context/`

**Structure:**
- `memory/` — synced from `~/.claude/projects/-/memory/` automatically
- `projects/` — active/past project details
- `ideas/` — ideas shared across sessions
- `rules/` — instructions for LLMs to follow
- `code-examples/` — useful snippets and patterns

**Sync:** `sync.sh` runs via system crontab every 4 hours (`17 */4 * * *`). Logs to `/tmp/llm-context-sync.log`.

**Why:** User wants a single source of truth usable with multiple LLMs, not just Claude.

**How to apply:** When the user shares a project detail, idea, rule, or code example, write/update the appropriate file inside `/Users/lautaro.rshaid/llm-context/` so it gets picked up on the next sync push. Also keep `memory/` files updated as usual.
