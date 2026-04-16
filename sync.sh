#!/bin/bash
cd /home/node/.openclaw/workspace/llm-context
git stash push -m "Pre-sync stash" 2>&1 || true
git pull origin main --rebase 2>&1
git stash pop 2>&1 || true

git add -A
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
git commit -m "Auto-sync: ${TIMESTAMP}" 2>&1 || true
git push origin main 2>&1 || true
echo "Sync completed at ${TIMESTAMP}" >> sync.log
