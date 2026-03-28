---
name: Finish session behavior
description: When ending a session, only commit/push llm-context — do not auto-push other repos unless explicitly asked
type: feedback
---

When the user says "finish" or ends a session, only commit and push ~/llm-context. Do not automatically commit or push changes in other repos (webapp, etc.) — only do that when explicitly asked.
