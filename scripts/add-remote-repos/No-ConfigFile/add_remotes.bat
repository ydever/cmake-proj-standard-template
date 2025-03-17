@echo off
setlocal enabledelayedexpansion

:: 定义远程仓库列表
set remotes[0]="origin https://github.com/ydever/cmake-proj-standard-template.git"
set remotes[1]="gitee https://gitee.com/youngwow/cmake-proj-standard-template.git"
set remotes[2]="cltgl http://10.168.10.124:9080/personal-project/cmake-proj-standard-template.git"

:: 添加远程仓库
for /L %%i in (0,1,1) do (
    set remote=!remotes[%%i]!
    for /f "tokens=1,2 delims= " %%a in ("!remote!") do (
        set name=%%a
        set url=%%b

        :: 检查远程仓库是否已存在
        git remote get-url !name! >nul 2>&1
        if errorlevel 1 (
            :: 添加远程仓库
            git remote add !name! !url!
            if errorlevel 1 (
                echo Failed to add remote: !name! -> !url!
            ) else (
                echo Successfully added remote: !name! -> !url!
            )
        ) else (
            echo Remote '!name!' already exists.
        )
    )
)

:: 验证远程仓库
git remote -v
endlocal