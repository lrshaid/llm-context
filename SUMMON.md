---
created: 2026-03-12
updated: 2026-03-12
tags:
  - type/reference
  - workflow
---

# How to Summon Context into Any LLM

## Option A -- Paste CONTEXT.md (recommended)

`CONTEXT.md` is auto-generated on every sync. It contains everything in one file.
Copy its contents and paste it as the first message or system prompt in any LLM.

## Option B -- Link the repo

Tell the LLM:
> "Read https://github.com/lrshaid/llm-context -- start with CONTEXT.md, then refer to the individual files in user/, feedback/, projects/, rules/, and references/ as needed."

## Option C -- Cherry-pick

Paste only the files relevant to your current task:
- [[user_profile]] -- who Lautaro is
- `feedback/*.md` -- how he wants LLMs to behave
- `projects/<name>.md` -- context for a specific project
- `rules/*.md` -- explicit instructions

## Folder reference

| Folder | What's in it |
|---|---|
| `user/` | Background, skills, working style |
| `feedback/` | Corrections and behavior rules given to LLMs |
| `projects/` | Active and past project details |
| `references/` | Articles, resources, external systems |
| `ideas/` | Ideas shared across sessions |
| `rules/` | Explicit instructions for LLMs |
| `CONTEXT.md` | Full aggregated context -- auto-generated |
