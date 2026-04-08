---
created: 2026-03-12
updated: 2026-04-07
tags:
  - type/feedback
  - workflow
---

# Pull Context Repo on Session Start

At the start of every new conversation, before doing anything else:
1. Run `cd /Users/lautarorshaid/llm-context && git pull origin main`
2. Read `/Users/lautarorshaid/llm-context/CONTEXT.md`
3. Use that context throughout the session

> [!info] Why
> Lautaro wants full persistent context available in every session regardless of working directory or topic.

**How to apply:** Always. Do it silently -- no need to announce it unless the pull fails.

See also: [[project_llm_context_repo]], [[reference_llm_context_repo]]
