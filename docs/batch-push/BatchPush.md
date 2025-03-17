Git多仓库推送之 Windows 批处理脚本 (`bat`) 的内容：

```bat
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

echo Finished pushing to all remotes.
```

### 说明：
1. **获取当前分支名称**：
   - 使用 `for /f` 命令来执行 `git rev-parse --abbrev-ref HEAD` 并捕获输出到 `CURRENT_BRANCH` 变量中。

2. **获取所有的远程仓库名称**：
   - 使用 `for /f` 命令来执行 `git remote` 并捕获输出到 `REMOTES` 变量中。

3. **检查是否有远程仓库**：
   - 使用 `if` 语句检查 `REMOTES` 是否为空，如果为空则输出提示信息并退出脚本。

4. **遍历每个远程仓库并推送**：
   - 使用 `for /f` 命令遍历 `git remote` 的输出，并对每个远程仓库执行 `git push` 操作。如果推送失败，则输出错误信息。

5. **输出完成信息**：
   - 在所有远程仓库推送完成后，输出完成信息。

### 注意事项：
- 在 Windows 批处理脚本中，`||` 用于在命令失败时执行后续命令，类似于 `bash` 中的 `||`。
- `exit /b 1` 用于退出批处理脚本并返回错误码 `1`。
- `@echo off` 用于关闭命令回显，使脚本输出更简洁。

你可以将上述内容保存为 `.bat` 文件并在 Windows 命令行中运行。