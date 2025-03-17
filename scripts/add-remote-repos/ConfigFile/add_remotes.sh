#!/bin/bash

# 定义配置文件路径
config_file="remotes.json"

# 检查配置文件是否存在
if [[ ! -f "$config_file" ]]; then
  echo "Configuration file not found: $config_file"
  exit 1
fi

# 使用 jq 解析 JSON 文件并读取远程仓库信息
remotes=$(cat "$config_file" | jq -c '.[]')

# 遍历每个远程仓库并添加
for remote in $(echo "${remotes}" | jq -r '. | @base64'); do
  _jq() {
    echo ${remote} | base64 --decode | jq -r ${1}
  }

  remote_name=$(_jq '.name')
  remote_url=$(_jq '.url')

  # 检查远程仓库是否已存在
  existing_remote=$(git remote get-url "$remote_name" 2>/dev/null)
  if [[ $? -eq 0 ]]; then
    echo "Remote '$remote_name' already exists with URL: $existing_remote"
  else
    # 添加远程仓库
    git remote add "$remote_name" "$remote_url"
    if [[ $? -eq 0 ]]; then
      echo "Successfully added remote: $remote_name -> $remote_url"
    else
      echo "Failed to add remote: $remote_name -> $remote_url"
    fi
  fi
done

echo "Finished adding remotes."

# 注意: 该脚本使用了 jq 工具来解析 JSON 文件。如果你的系统上没有安装 jq，可以通过以下命令进行安装：

# Linux: sudo apt-get install jq 或 sudo yum install jq
# macOS: brew install jq