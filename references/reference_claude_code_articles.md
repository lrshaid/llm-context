---
name: Claude Code Articles & Learnings
description: Key articles about Claude Code architecture, skills, hooks, subagents, MCP — reference for building better workflows
type: reference
created: 2026-03-23
---

## Article 1: "Lessons from Building Claude Code: How We Use Skills" — Thariq (@trq212, Anthropic)
**Date:** 2026-03-17
**Source:** https://x.com/trq212/status/2033949937936085378

### Skill Categories
1. **Library & API Reference** — how to use a library/CLI correctly, gotchas, code snippets
2. **Product Verification** — test/verify code works (playwright, tmux, video recording, assertions)
3. **Data Fetching & Analysis** — connect to data stacks, credentials, dashboard IDs, common workflows
4. **Business Process & Team Automation** — standup posts, ticket creation, weekly recaps
5. **Code Scaffolding & Templates** — generate boilerplate for specific patterns
6. **Code Quality & Review** — enforce style, adversarial review, testing practices
7. **CI/CD & Deployment** — babysit PRs, deploy pipelines, cherry-picks
8. **Runbooks** — symptom → investigation → structured report
9. **Infrastructure Operations** — orphan cleanup, dependency management, cost investigation

### Best Practices
- Skills are **folders**, not just markdown — include scripts, data, templates, references
- Focus on **gotchas** (where Claude fails), not obvious stuff
- **Progressive disclosure** — split details into subfiles (`references/`, `scripts/`, `examples/`)
- Don't over-specify — give info but let Claude adapt
- **Store memory in the skill** (logs, config.json) for continuity — use `${CLAUDE_PLUGIN_DATA}` for stable storage
- Include **helper scripts** Claude can compose
- **Description field is for the model** — write it as a trigger condition, not a summary
- **On-demand hooks** in skills for opinionated behavior (e.g., `/careful` blocks destructive commands)
- Distribution: check into repo (`.claude/skills`) or plugin marketplace for scale

---

## Article 2: "¿Cómo funciona realmente Claude Code?" — Santi (@santtiagom_)
**Date:** 2026-03-23 (approx)
**Source:** X post

### Core Architecture
1. **Agent Loop** — the heart: gather context → take action → verify results → repeat
   - Adapts to the task (simple question = context only, bug fix = all 3 phases)
   - User is part of the loop — can interrupt, redirect, add context

2. **Tools** — how Claude acts in the world
   - Read/Edit/Write (files), Bash (terminal), Grep/Glob (search), WebFetch/WebSearch (internet)
   - Each tool call: Claude decides → system executes → result back → next decision

3. **Context & Memory**
   - Context = everything accumulated during the session (files read, actions taken, results)
   - Limited capacity — long sessions lose early info
   - Memory = persistent files loaded at session start
     - `~/.claude/CLAUDE.md` — personal preferences (all projects)
     - `/project/CLAUDE.md` — repo-specific (keep under 200 lines)
     - `.claude/rules/` — modular rules by file type
     - Auto Memory — Claude's own notes in `~/.claude/projects/<project>/memory/`

4. **Hooks** — deterministic control points
   - PreToolUse (can block), PostToolUse, Notification, Stop
   - Always execute — not suggestions Claude can ignore

5. **Skills** — consistency for repeated tasks
   - Folder with SKILL.md + optional templates, examples, scripts
   - Invoked manually (`/skill-name`) or auto-triggered by description match
   - 100+ skills possible for heavy users

6. **SubAgents** — delegate to preserve context
   - Separate instance with own context, returns summary
   - Can run in parallel
   - Native: Explore (read-only), Plan (investigation), General-purpose
   - Custom: defined in `.claude/agents/` with tool restrictions

7. **MCP** — connect to external services
   - Client-server: Claude Code = client, each service has MCP server
   - GitHub (PRs, issues), Postgres/Supabase, Slack, Jira

### Key Takeaway
Everything serves the loop. Memory to start informed. Tools to act. Hooks to control. Skills to standardize. SubAgents to scale. MCP to connect externally.

### Suggested Starting Points
- Review Auto Memory and clean up bad patterns
- Create CLAUDE.md for your project (`/init`)
- Connect GitHub MCP
- Build a SubAgent for context-heavy tasks
- Configure a Hook that runs tests after each change
