---
created: 2026-03-12
updated: 2026-04-07
tags:
  - type/project
  - ai
  - workflow
aliases:
  - llm-context project
---

# LLM Context Repo

A persistent context repo lives at https://github.com/lrshaid/llm-context (account: lrshaid).

Local path: `/Users/lautarorshaid/llm-context/`

**Structure:**
- `user/` -- profile, workflow, writing style
- `feedback/` -- corrections and behavior rules
- `projects/` -- active/past project details
- `ideas/` -- ideas shared across sessions
- `rules/` -- instructions for LLMs to follow
- `references/` -- external systems, articles, resources

**Sync:** `sync.sh` runs via system crontab every 4 hours (`17 */4 * * *`). Logs to `/tmp/llm-context-sync.log`.

> [!info] Why
> User wants a single source of truth usable with multiple LLMs, not just Claude.

**How to apply:** When the user shares a project detail, idea, rule, or code example, write/update the appropriate file inside `/Users/lautarorshaid/llm-context/` so it gets picked up on the next sync push.

See also: [[reference_llm_context_repo]], [[feedback_context_sync]], [[user_ai_workflow]]
