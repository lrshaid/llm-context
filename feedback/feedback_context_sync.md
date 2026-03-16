---
name: feedback - pull context repo on session start
type: feedback
description: At the start of every conversation, pull llm-context repo and read CONTEXT.md
---

At the start of every new conversation, before doing anything else:
1. Run `cd /Users/lautaro.rshaid/llm-context && git pull origin main`
2. Read `/Users/lautaro.rshaid/llm-context/CONTEXT.md`
3. Use that context throughout the session

**Why:** Lautaro wants full persistent context available in every session regardless of working directory or topic.
**How to apply:** Always. Do it silently — no need to announce it unless the pull fails.
