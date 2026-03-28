---
created: 2026-03-23
updated: 2026-03-24
tags:
  - type/user
  - ai
  - mejuri
  - workflow
aliases:
  - ai workflow
---

# AI Development Workflow

Current data development workflow at Mejuri:

- **IDE**: VS Code with Claude integration
- **Data stack**: BigQuery + dbt CLI
- **BI/Reporting**: Omni (with AI context augmentation)
- **LLM context**: Persistent context repo (~/llm-context) synced across tools

Using AI to augment the full data development cycle -- writing/reviewing SQL and dbt models in VS Code with Claude, then surfacing insights through Omni with AI context augmentation.

See also: [[user_profile]], [[project_llm_context_repo]], [[reference_claude_code_articles]]
