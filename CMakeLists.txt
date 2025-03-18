cmake_minimum_required(VERSION 3.19)

#include("cmake/x64-windows-mingw.cmake")

project(cmake_proj_standard_template VERSION 1.0.0 LANGUAGES CXX)

# Set the C++ standard
set(CMAKE_CXX_STANDARD 17)

# Set the C++ standard required
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set the C++ standard extension
set(CMAKE_CXX_EXTENSIONS OFF)

# Set the build type
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# Set the output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# Set the source files
set(SOURCE_FILES
    src/main.cpp
)

message(STATUS "CMAKE_C_COMPILER: ${CMAKE_C_COMPILER}")
message(STATUS "CMAKE_CXX_COMPILER: ${CMAKE_CXX_COMPILER}")
message(STATUS "CMAKE_CXX_FLAGS: ${CMAKE_CXX_FLAGS}")

# Add the executable
add_executable(${PROJECT_NAME} ${SOURCE_FILES})