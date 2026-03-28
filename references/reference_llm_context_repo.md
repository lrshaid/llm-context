---
created: 2026-03-16
updated: 2026-03-18
tags:
  - type/reference
  - ai
  - workflow
aliases:
  - llm-context reference
---

# LLM Context Repo Reference

- Repo: https://github.com/lrshaid/llm-context.git
- Local path: ~/llm-context/
- Structure: user/, feedback/, projects/, ideas/, rules/, references/
- Sync: sync.sh runs via crontab every 4h (17 */4 * * *)
- Logs: /tmp/llm-context-sync.log
- When user shares a project detail, idea, rule, or code example, write/update the appropriate file inside ~/llm-context/ so it gets picked up on next sync

See also: [[project_llm_context_repo]], [[feedback_context_sync]]
