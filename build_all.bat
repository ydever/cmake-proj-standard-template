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
  cmake --build --preset=%%p-build
  if errorlevel 1 (
    echo Build failed for preset: %%p-build
    exit /b 1
  )
  echo Build completed for preset: %%p
)

echo All presets built successfully!