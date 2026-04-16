#!/bin/bash
cd /home/node/.openclaw/workspace/llm-context
git pull origin main --rebase 2>&1
cp /home/node/.openclaw/workspace/personality.md ./ 2>/dev/null
cp /home/node/.openclaw/workspace/IDENTITY.md ./ 2>/dev/null
cp /home/node/.openclaw/workspace/project.md ./ 2>/dev/null
git add -A
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
git commit -m "Auto-sync: ${TIMESTAMP}" 2>&1 || true
git push origin main 2>&1 || true
echo "Sync completed at ${TIMESTAMP}" >> sync.log
