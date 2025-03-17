# 定义远程仓库列表
$remotes = @(
    @{ name = "origin"; url = "https://github.com/ydever/cmake-proj-standard-template.git" },
    @{ name = "gitee"; url = "https://gitee.com/youngwow/cmake-proj-standard-template.git" },
    @{ name = "cltgl"; url = "http://10.168.10.124:9080/personal-project/cmake-proj-standard-template.git" }
)

# 添加远程仓库
foreach ($remote in $remotes) {
    $name = $remote.name
    $url = $remote.url

    # 检查远程仓库是否已存在
    $existingRemote = git remote get-url $name -q 2>$null
    if ($?) {
        Write-Output "Remote '$name' already exists with URL: $existingRemote"
    }
    else {
        # 添加远程仓库
        git remote add $name $url
        if ($?) {
            Write-Output "Successfully added remote: $name -> $url"
        }
        else {
            Write-Output "Failed to add remote: $name -> $url"
        }
    }
}

# 验证远程仓库
git remote -v