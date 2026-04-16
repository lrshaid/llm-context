---
created: 2026-04-16
updated: 2026-04-16
tags:
  - type/rule
  - openclaw
---

# Agent Configuration Sync Rules

## Overview

Keep agent configuration files synchronized across:
1. **OpenClaw workspace** (`~/.openclaw/workspace/AGENTS.md`)
2. **llm-context repo** (`llm-context/rules/claude.md`)
3. **Main workspace** (`AGENTS.md`)

## Sync Workflow

### On Session Start
1. Read `AGENTS.md` from workspace
2. If `llm-context/rules/claude.md` exists, compare versions
3. If `claude.md` is newer → update workspace `AGENTS.md`
4. If workspace `AGENTS.md` is newer → update `claude.md`

### On Agent Update
When `AGENTS.md` is modified:
1. Copy changes to `llm-context/rules/claude.md`
2. Commit to llm-context repo
3. Log sync in `llm-context/sync.log`

### Manual Sync Command
User can request: "sync agents.md" to force bidirectional sync.

## File Locations

```
~/.openclaw/workspace/AGENTS.md          # OpenClaw workspace
llm-context/rules/claude.md              # Git-tracked version
```

## Conflict Resolution

If both files have been modified:
1. Show diff to user
2. Ask which version to keep or merge manually
3. Never auto-overwrite without user approval

## Implementation Notes

- Use `git log -1 --format=%ct <file>` to compare timestamps
- Use `diff` to detect changes
- Always backup before overwriting
- Log all sync operations with timestamp

## Related Files

- [[feedback_commit_push_on_exit]] - Auto-commit llm-context on session end
- [[feedback_context_sync]] - Pull context repo on session start
