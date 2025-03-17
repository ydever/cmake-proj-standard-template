CMake 是一个跨平台的构建系统生成工具，主要用于管理 C++ 项目的构建过程，但也支持其他编程语言。以下是 CMake 支持构建语言的详细介绍：

### 1. **C (CXX)**
   - **支持版本**：C90、C99、C11、C17
   - **CMake 命令**：
     ```cmake
     project(MyProject C)
     ```
   - **说明**：CMake 默认支持 C 语言，可以通过 `project` 命令指定项目语言为 C。

### 2. **C++ (CXX)**
   - **支持版本**：C++98、C++11、C++14、C++17、C++20
   - **CMake 命令**：
     ```cmake
     project(MyProject CXX)
     ```
   - **说明**：CMake 默认支持 C++ 语言，可以通过 `project` 命令指定项目语言为 C++。还可以通过 `set(CMAKE_CXX_STANDARD 11)` 指定 C++ 标准。

### 3. **Fortran**
   - **支持版本**：Fortran 77、Fortran 90、Fortran 95、Fortran 2003、Fortran 2008
   - **CMake 命令**：
     ```cmake
     project(MyProject Fortran)
     ```
   - **说明**：CMake 支持 Fortran 语言，可以通过 `project` 命令指定项目语言为 Fortran。

### 4. **CUDA**
   - **支持版本**：CUDA 7.0 及以上
   - **CMake 命令**：
     ```cmake
     project(MyProject CUDA)
     ```
   - **说明**：CMake 支持 CUDA 语言，可以通过 `project` 命令指定项目语言为 CUDA。需要安装 CUDA 工具包。

### 5. **Objective-C**
   - **支持版本**：Objective-C 2.0
   - **CMake 命令**：
     ```cmake
     project(MyProject Objective-C)
     ```
   - **说明**：CMake 支持 Objective-C 语言，可以通过 `project` 命令指定项目语言为 Objective-C。

### 6. **Objective-C++**
   - **支持版本**：Objective-C++ 2.0
   - **CMake 命令**：
     ```cmake
     project(MyProject Objective-CXX)
     ```
   - **说明**：CMake 支持 Objective-C++ 语言，可以通过 `project` 命令指定项目语言为 Objective-C++。

### 7. **ASM (汇编语言)**
   - **支持版本**：多种汇编语言
   - **CMake 命令**：
     ```cmake
     enable_language(ASM)
     ```
   - **说明**：CMake 支持汇编语言，可以通过 `enable_language` 命令启用汇编语言支持。

### 8. **Swift**
   - **支持版本**：Swift 3.0 及以上
   - **CMake 命令**：
     ```cmake
     project(MyProject Swift)
     ```
   - **说明**：CMake 支持 Swift 语言，可以通过 `project` 命令指定项目语言为 Swift。

### 9. **Java**
   - **支持版本**：Java 1.6 及以上
   - **CMake 命令**：
     ```cmake
     project(MyProject Java)
     ```
   - **说明**：CMake 支持 Java 语言，可以通过 `project` 命令指定项目语言为 Java。

### 10. **C#**
   - **支持版本**：C# 3.0 及以上
   - **CMake 命令**：
     ```cmake
     project(MyProject CSharp)
     ```
   - **说明**：CMake 支持 C# 语言，可以通过 `project` 命令指定项目语言为 C#。

### 11. **Python**
   - **支持版本**：Python 2.7 及以上
   - **CMake 命令**：
     ```cmake
     project(MyProject Python)
     ```
   - **说明**：CMake 支持 Python 语言，可以通过 `project` 命令指定项目语言为 Python。

### 12. **其他语言**
   - **支持版本**：CMake 还支持其他一些语言，如 Go、Rust 等，但需要额外的模块或插件支持。
   - **CMake 命令**：
     ```cmake
     enable_language(Go)
     enable_language(Rust)
     ```
   - **说明**：CMake 支持通过 `enable_language` 命令启用其他语言支持。

### 总结
CMake 支持多种编程语言，可以通过 `project` 或 `enable_language` 命令指定项目语言。不同语言的支持程度和版本可能有所不同，建议查阅 CMake 官方文档以获取最新信息。