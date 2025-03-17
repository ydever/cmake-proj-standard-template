@echo off
setlocal enabledelayedexpansion

:: 定义配置文件路径
set config_file=remotes.json

:: 检查配置文件是否存在
if not exist "%config_file%" (
  echo Configuration file not found: %config_file%
  exit /b 1
)

:: 使用 PowerShell 解析 JSON 文件并读取远程仓库信息
for /f "tokens=* delims=" %%a in ('powershell -NoProfile -ExecutionPolicy Bypass -Command "(Get-Content '%config_file%' | ConvertFrom-Json)"') do (
  set "json=%%a"
)

:: 将 JSON 数据逐行解析并添加远程仓库
for /f "tokens=1,2 delims=:," %%i in ('echo %json% ^| findstr /R /C:"\"name\"" /C:"\"url\""') do (
  set "line=%%i:%%j"
  set "line=!line:~1,-1!"
  for /f "tokens=1,2 delims=:" %%n in ("!line!") do (
    set "key=%%n"
    set "value=%%o"
    set "value=!value:~1,-1!"

    if "!key!"=="name" (
      set "remote_name=!value!"
    ) else if "!key!"=="url" (
      set "remote_url=!value!"

      :: 检查远程仓库是否已存在
      for /f "tokens=*" %%x in ('git remote get-url "!remote_name!" 2^>nul') do (
        echo Remote '!remote_name!' already exists with URL: %%x
      )

      if errorlevel 1 (
        :: 添加远程仓库
        git remote add "!remote_name!" "!remote_url!"
        if errorlevel 1 (
          echo Failed to add remote: !remote_name! -> !remote_url!
        ) else (
          echo Successfully added remote: !remote_name! -> !remote_url!
        )
      )
    )
  )
)

echo Finished adding remotes.
endlocal