# 一
# 定义配置文件路径
# $configFilePath = "$PSScriptRoot\remotes.json"

# # 检查配置文件是否存在
# if (-not (Test-Path $configFilePath)) {
#   Write-Output "Configuration file not found: $configFilePath"
#   exit 1
# }

# # 读取配置文件内容
# $remotes = Get-Content -Path $configFilePath | ConvertFrom-Json

# -----------------------------------------------------------------------------

# 二：允许用户通过命令行参数指定配置文件路径
# example: .\add_remotes.ps1 -ConfigFile "path\to\your\remotes.json"
param (
  [string]$ConfigFile = "$PSScriptRoot\remotes.json"
)

# 检查配置文件是否存在
if (-not (Test-Path $ConfigFile)) {
  Write-Error "Configuration file not found: $ConfigFile"
  exit 1
}

# 读取配置文件内容
$remotes = Get-Content -Path $ConfigFile | ConvertFrom-Json

# -----------------------------------------------------------------------------

# 遍历每个远程仓库并添加
foreach ($remote in $remotes) {
  $remoteName = $remote.name
  $remoteUrl = $remote.url

  # 检查远程仓库是否已存在
  try {
    $existingRemote = git remote get-url $remoteName -q 2>$null
    if (-not $?) {
      Write-Output "Remote '$remoteName' does not exist. Adding..."
      # 添加远程仓库
      git remote add $remoteName $remoteUrl
      if ($?) {
        Write-Output "Successfully added remote: $remoteName -> $remoteUrl"
      }
      else {
        Write-Output "Failed to add remote: $remoteName -> $remoteUrl"
        Write-Output "Error details: $(git remote add $remoteName $remoteUrl 2>&1)"
      }
    }
    else {
      Write-Output "Remote '$remoteName' already exists with URL: $existingRemote"
    }
  }
  catch {
    Write-Output "An error occurred while processing remote: $remoteName"
    Write-Output $_.Exception.Message
  }
}

Write-Output "Finished adding remotes."