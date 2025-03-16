# For x64 Windows with MinGW, using the x86_64-w64-mingw32 toolchain
# please make sure to have the MinGW toolchain installed and in your PATH
set(CMAKE_SYSTEM_NAME Windows)
set(CMAKE_C_COMPILE "x86_64-w64-mingw32-gcc")
set(CMAKE_CXX_COMPILE "x86_64-w64-mingw32-g++")