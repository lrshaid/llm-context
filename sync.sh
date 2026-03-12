#!/bin/zsh
# Syncs Claude Code memory and llm-context repo to GitHub every 4 hours

set -e

REPO_DIR="/Users/lautaro.rshaid/llm-context"
MEMORY_SRC="/Users/lautaro.rshaid/.claude/projects/-/memory"
MEMORY_DST="$REPO_DIR/memory"

# Sync Claude memory files into repo
if [ -d "$MEMORY_SRC" ]; then
  rsync -a --delete "$MEMORY_SRC/" "$MEMORY_DST/"
fi

cd "$REPO_DIR"

# Stage all changes
git add -A

# Commit only if there are changes
if ! git diff --cached --quiet; then
  git -c user.name="lrshaid" -c user.email="lautarorshaid@outlook.com" \
    commit -m "sync: $(date '+%Y-%m-%d %H:%M')"
  git push origin main
  echo "$(date): pushed changes" >> /tmp/llm-context-sync.log
else
  echo "$(date): no changes" >> /tmp/llm-context-sync.log
fi
