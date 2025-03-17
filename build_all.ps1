# 获取所有预设配置名称
#$PRESETS = cmake --list-presets | Select-Object -Skip 2 | ForEach-Object { $_.Split()[0] }
$PRESETS = cmake --list-presets | Select-Object -Skip 1 | ForEach-Object {
    if ($_ -match '^\s*"([^"]+)"') {
        $matches[1]
    }
}

# 打印 cmake --list-presets 的输出
Write-Host "Output of cmake --list-presets:"
cmake --list-presets

# 打印解析后的预设名称
Write-Host "Parsed presets:"
$PRESETS

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
    cmake --build --preset=${PRESET}-build
    if (-Not $?) {
        Write-Host "Build failed for preset: $PRESET" -ForegroundColor Red
        exit 1
    }
    Write-Host "Build completed for preset: $PRESET" -ForegroundColor Green
}

Write-Host "All presets built successfully!" -ForegroundColor Green