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
  cmake --preset=$PRESET && cmake --build --preset=${PRESET}-build
  if [ $? -ne 0 ]; then
    echo "Build failed for preset: $PRESET"
    exit 1
  fi
  echo "Build completed for preset: $PRESET"
done

echo "All presets built successfully!"