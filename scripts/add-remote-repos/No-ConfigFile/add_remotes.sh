#!/bin/bash

# 定义远程仓库列表
remotes=(
  "origin https://github.com/ydever/cmake-proj-standard-template.git"
  "gitee https://gitee.com/youngwow/cmake-proj-standard-template.git"
  "cltgl http://10.168.10.124:9080/personal-project/cmake-proj-standard-template.git"
)

# 添加远程仓库
for remote in "${remotes[@]}"; do
  name=$(echo $remote | cut -d ' ' -f 1)
  url=$(echo $remote | cut -d ' ' -f 2-)
  git remote add $name $url
done

# 验证远程仓库
git remote -v