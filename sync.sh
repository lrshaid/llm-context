#!/bin/bash

# Detect environment and set repo path
if [ -d "/home/node/.openclaw/workspace/llm-context" ]; then
  REPO_DIR="/home/node/.openclaw/workspace/llm-context"
elif [ -d "$HOME/llm-context" ]; then
  REPO_DIR="$HOME/llm-context"
else
  echo "Error: llm-context repo not found" >&2
  exit 1
fi

cd "$REPO_DIR"

git stash push -m "Pre-sync stash" 2>&1 || true
git pull origin main --rebase 2>&1
git stash pop 2>&1 || true

git add -A
TIMESTAMP=$(date -u +%Y-%m-%dT%H:%M:%SZ)
git commit -m "Auto-sync: ${TIMESTAMP}" 2>&1 || true
git push origin main 2>&1 || true
echo "Sync completed at ${TIMESTAMP}" >> sync.log
