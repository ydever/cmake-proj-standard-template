@echo off

:: 获取当前分支名称
for /f "delims=" %%b in ('git rev-parse --abbrev-ref HEAD') do set CURRENT_BRANCH=%%b

:: 获取所有的远程仓库名称
for /f "delims=" %%r in ('git remote') do set REMOTES=%%r

:: 检查是否有远程仓库
if "%REMOTES%"=="" (
  echo No remotes found.
  exit /b 1
)

:: 遍历每个远程仓库并推送
for /f "delims=" %%r in ('git remote') do (
  echo Pushing to remote: %%r on branch: %CURRENT_BRANCH%
  git push %%r %CURRENT_BRANCH% || echo Failed to push to %%r
)

echo Finished pushing