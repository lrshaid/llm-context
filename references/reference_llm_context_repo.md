---
created: 2026-03-12
updated: 2026-04-07
name: llm-context repo
description: Persistent context repo at ~/llm-context (GitHub: lrshaid/llm-context) — single source of truth for profile, projects, ideas, rules, code examples across all LLMs
type: reference
---

- Repo: https://github.com/lrshaid/llm-context.git
- Local path: ~/llm-context/
- Structure: user/, feedback/, projects/, ideas/, rules/, references/, code-examples/
- Sync: sync.sh runs via crontab every 4h (17 */4 * * *)
- Logs: /tmp/llm-context-sync.log
- When user shares a project detail, idea, rule, or code example, write/update the appropriate file inside ~/llm-context/ so it gets picked up on next sync
