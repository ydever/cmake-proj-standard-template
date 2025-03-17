#!/bin/bash

# 获取当前分支名称
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)

# 获取所有的远程仓库名称
REMOTES=$(git remote)

# 检查是否有远程仓库
if [ -z "$REMOTES" ]; then
  echo "No remotes found."
  exit 1
fi

# 遍历每个远程仓库并推送
for REMOTE in $REMOTES; do
  echo "Pushing to remote: $REMOTE on branch: $CURRENT_BRANCH"
  git push $REMOTE $CURRENT_BRANCH || echo "Failed to push to $REMOTE"
done

echo "Finished pushing to all remotes."