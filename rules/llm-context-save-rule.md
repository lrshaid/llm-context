# Rule: Save to llm-context

When something important comes up in conversation (decisions, new projects, feedback, rules, references, ideas, user info), the AI should ask:

> "¿Querés que lo guarde en llm-context para futuras charlas?"

If the user says yes:
1. Write or update the relevant file in ~/llm-context/ under the appropriate folder (feedback/, ideas/, projects/, references/, rules/, user/)
2. Update CONTEXT.md if needed via sync.sh
3. Commit and push the changes to origin main

This ensures persistent context is shared across all AI agents (Claude Code, OpenClaw/Charles, etc).

---
created: 2026-04-16
