以下是针对 CMake 项目的配置和构建脚本，分别用 `bash`（适用于 Linux/macOS）、`PowerShell`（适用于 Windows）和 `bat`（适用于 Windows）编写。

---

### 1. **Bash 脚本 (`build.sh`)**  
适用于 Linux/macOS 或 Windows 上的 Git Bash/WSL。

```bash
#!/bin/bash

# 设置构建目录
BUILD_DIR="build"

# 检查并创建构建目录
if [ ! -d "$BUILD_DIR" ]; then
  echo "Creating build directory..."
  mkdir -p "$BUILD_DIR"
fi

# 进入构建目录
cd "$BUILD_DIR" || exit 1

# 运行 CMake 配置
echo "Configuring CMake..."
cmake .. || { echo "CMake configuration failed"; exit 1; }

# 运行构建
echo "Building project..."
cmake --build . || { echo "Build failed"; exit 1; }

echo "Build completed successfully!"
```

#### 使用方法：
1. 将脚本保存为 `build.sh`。
2. 赋予执行权限：`chmod +x build.sh`。
3. 运行脚本：`./build.sh`。

---

### 2. **PowerShell 脚本 (`build.ps1`)**  
适用于 Windows 上的 PowerShell。

```powershell
# 设置构建目录
$BUILD_DIR = "build"

# 检查并创建构建目录
if (-Not (Test-Path -Path $BUILD_DIR)) {
    Write-Host "Creating build directory..."
    New-Item -ItemType Directory -Path $BUILD_DIR | Out-Null
}

# 进入构建目录
Set-Location -Path $BUILD_DIR

# 运行 CMake 配置
Write-Host "Configuring CMake..."
cmake ..
if (-Not $?) {
    Write-Host "CMake configuration failed" -ForegroundColor Red
    exit 1
}

# 运行构建
Write-Host "Building project..."
cmake --build .
if (-Not $?) {
    Write-Host "Build failed" -ForegroundColor Red
    exit 1
}

Write-Host "Build completed successfully!" -ForegroundColor Green
```

#### 使用方法：
1. 将脚本保存为 `build.ps1`。
2. 在 PowerShell 中运行脚本：`.\build.ps1`。
   - 如果遇到权限问题，请先运行：`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`。

---

### 3. **Batch 脚本 (`build.bat`)**  
适用于 Windows 上的命令提示符（CMD）。

```bat
@echo off

:: 设置构建目录
set BUILD_DIR=build

:: 检查并创建构建目录
if not exist "%BUILD_DIR%" (
  echo Creating build directory...
  mkdir "%BUILD_DIR%"
)

:: 进入构建目录
cd "%BUILD_DIR%" || exit /b 1

:: 运行 CMake 配置
echo Configuring CMake...
cmake ..
if errorlevel 1 (
  echo CMake configuration failed
  exit /b 1
)

:: 运行构建
echo Building project...
cmake --build .
if errorlevel 1 (
  echo Build failed
  exit /b 1
)

echo Build completed successfully!
```

#### 使用方法：
1. 将脚本保存为 `build.bat`。
2. 双击运行或在命令提示符中运行：`build.bat`。

---

### 功能说明：
1. **构建目录**：
   - 脚本会在项目根目录下创建一个 `build` 目录，用于存放 CMake 生成的构建文件。
2. **CMake 配置**：
   - 运行 `cmake ..` 配置项目。
3. **构建项目**：
   - 运行 `cmake --build .` 构建项目。
4. **错误处理**：
   - 如果配置或构建失败，脚本会输出错误信息并退出。

---

### 注意事项：
- 确保系统中已安装 CMake，并且已将其添加到环境变量中。
- 如果项目需要额外的 CMake 参数（如指定生成器或编译类型），可以在 `cmake ..` 命令中添加，例如：
  - `cmake -G "Visual Studio 16 2019" ..`（指定生成器）
  - `cmake -DCMAKE_BUILD_TYPE=Release ..`（指定编译类型）。

希望这些脚本能帮助你快速配置和构建 CMake 项目！