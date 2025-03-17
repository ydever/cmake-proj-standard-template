以下是针对 CMake 项目通过 `CMakePresets.json` 构建的脚本，支持一次性构建所有预设配置。脚本分别用 `bash`、`PowerShell` 和 `bat` 编写。

---

### 1. **Bash 脚本 (`build_all.sh`)**  
适用于 Linux/macOS 或 Windows 上的 Git Bash/WSL。

```bash
#!/bin/bash

# 获取所有预设配置名称
PRESETS=$(cmake --list-presets | awk 'NR>2 {print $1}')

# 检查是否有预设配置
if [ -z "$PRESETS" ]; then
  echo "No presets found in CMakePresets.json."
  exit 1
fi

# 遍历每个预设配置并构建
for PRESET in $PRESETS; do
  echo "Building preset: $PRESET"
  cmake --preset=$PRESET && cmake --build --preset=$PRESET
  if [ $? -ne 0 ]; then
    echo "Build failed for preset: $PRESET"
    exit 1
  fi
  echo "Build completed for preset: $PRESET"
done

echo "All presets built successfully!"
```

#### 使用方法：
1. 将脚本保存为 `build_all.sh`。
2. 赋予执行权限：`chmod +x build_all.sh`。
3. 运行脚本：`./build_all.sh`。

---

### 2. **PowerShell 脚本 (`build_all.ps1`)**  
适用于 Windows 上的 PowerShell。

```powershell
# 获取所有预设配置名称
$PRESETS = cmake --list-presets | Select-Object -Skip 2 | ForEach-Object { $_.Split()[0] }

# 检查是否有预设配置
if (-Not $PRESETS) {
    Write-Host "No presets found in CMakePresets.json." -ForegroundColor Red
    exit 1
}

# 遍历每个预设配置并构建
foreach ($PRESET in $PRESETS) {
    Write-Host "Building preset: $PRESET" -ForegroundColor Cyan
    cmake --preset=$PRESET
    if (-Not $?) {
        Write-Host "Build failed for preset: $PRESET" -ForegroundColor Red
        exit 1
    }
    cmake --build --preset=$PRESET
    if (-Not $?) {
        Write-Host "Build failed for preset: $PRESET" -ForegroundColor Red
        exit 1
    }
    Write-Host "Build completed for preset: $PRESET" -ForegroundColor Green
}

Write-Host "All presets built successfully!" -ForegroundColor Green
```

#### 使用方法：
1. 将脚本保存为 `build_all.ps1`。
2. 在 PowerShell 中运行脚本：`.\build_all.ps1`。
   - 如果遇到权限问题，请先运行：`Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass`。

---

### 3. **Batch 脚本 (`build_all.bat`)**  
适用于 Windows 上的命令提示符（CMD）。

```bat
@echo off

:: 获取所有预设配置名称
for /f "skip=2 tokens=1" %%p in ('cmake --list-presets') do (
  set PRESET=%%p
  echo Building preset: %%p
  cmake --preset=%%p
  if errorlevel 1 (
    echo Build failed for preset: %%p
    exit /b 1
  )
  cmake --build --preset=%%p
  if errorlevel 1 (
    echo Build failed for preset: %%p
    exit /b 1
  )
  echo Build completed for preset: %%p
)

echo All presets built successfully!
```

#### 使用方法：
1. 将脚本保存为 `build_all.bat`。
2. 双击运行或在命令提示符中运行：`build_all.bat`。

---

### 功能说明：
1. **获取预设配置**：
   - 使用 `cmake --list-presets` 获取 `CMakePresets.json` 中定义的所有预设配置名称。
2. **遍历并构建**：
   - 遍历每个预设配置，依次运行 `cmake --preset` 和 `cmake --build --preset`。
3. **错误处理**：
   - 如果某个预设配置构建失败，脚本会输出错误信息并退出。

---

### 注意事项：
1. **CMake 版本**：
   - 确保 CMake 版本支持 `--preset` 和 `--list-presets` 参数（CMake 3.20 及以上版本）。
2. **预设配置**：
   - 确保 `CMakePresets.json` 文件已正确配置。
3. **构建目录**：
   - 每个预设配置的构建目录由 `CMakePresets.json` 中的 `binaryDir` 指定。

---

### 示例 `CMakePresets.json`：
```json
{
  "version": 3,
  "configurePresets": [
    {
      "name": "debug",
      "displayName": "Debug",
      "binaryDir": "build/debug",
      "generator": "Ninja",
      "cacheVariables": {
        "CMAKE_BUILD_TYPE": "Debug"
      }
    },
    {
      "name": "release",
      "displayName": "Release",
      "binaryDir": "build/release",
      "generator": "Ninja",
      "cacheVariables": {
        "CMAKE_BUILD_TYPE": "Release"
      }
    }
  ],
  "buildPresets": [
    {
      "name": "debug",
      "configurePreset": "debug"
    },
    {
      "name": "release",
      "configurePreset": "release"
    }
  ]
}
```

---

希望这些脚本能帮助你一次性构建所有 CMake 预设配置！