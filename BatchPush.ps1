# 获取当前分支名称
$currentBranch = git rev-parse --abbrev-ref HEAD

# 获取所有的远程仓库名称
$remotes = git remote

# 检查是否有远程仓库
if (-not $remotes) {
    Write-Host "No remotes found."
    exit 1
}

# 遍历每个远程仓库并推送
foreach ($remote in $remotes) {
    Write-Host "Pushing to remote: $remote on branch: $currentBranch"
    git push $remote $currentBranch
    if ($LASTEXITCODE -ne 0) {
        Write-Host "Failed to push to $remote" -ForegroundColor Red
    }else{
        Write-Host "Pushing to remote: $remote on branch: $currentBranch successed!" -ForegroundColor Green
    }
}

Write-Output "Finished pushing"