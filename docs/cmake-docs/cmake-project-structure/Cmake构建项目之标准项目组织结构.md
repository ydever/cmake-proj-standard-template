作为一名开发专家，设计一个标准的、完全的 CMake 构建系统管理的项目文件夹结构时，需要遵循以下原则：

1. **模块化**：将代码、资源、测试、文档等分离，便于管理和维护。
2. **可扩展性**：支持未来功能的扩展和模块的添加。
3. **跨平台**：确保项目可以在不同平台（如 Windows、Linux、macOS）上构建和运行。
4. **清晰的依赖管理**：明确项目的依赖关系，便于构建和部署。
5. **自动化**：通过 CMake 实现自动化构建、测试和打包。

以下是一个标准的 CMake 项目文件夹结构示例：

---

## **标准 CMake 项目文件夹结构**

```
MyProject/                     # 项目根目录
├── CMakeLists.txt             # 项目主 CMake 配置文件
├── README.md                  # 项目说明文档
├── LICENSE                    # 项目许可证文件
├── .gitignore                 # Git 忽略文件
├── .clang-format              # 代码格式化配置文件（可选）
├── .github/                   # GitHub 相关配置（如 CI/CD）
│   └── workflows/
│       └── ci.yml             # GitHub Actions 配置文件
├── cmake/                     # 自定义 CMake 模块和脚本
│   ├── FindMyLibrary.cmake    # 自定义 Find 模块（可选）
│   └── MyProjectConfig.cmake  # 项目配置文件（用于安装）
├── include/                   # 公共头文件
│   └── MyProject/             # 项目公共头文件（推荐使用命名空间）
│       ├── Module1.h
│       └── Module2.h
├── src/                       # 项目源代码
│   ├── Module1/               # 模块 1
│   │   ├── CMakeLists.txt     # 模块 1 的 CMake 配置文件
│   │   ├── Module1.cpp
│   │   └── Module1.h
│   ├── Module2/               # 模块 2
│   │   ├── CMakeLists.txt
│   │   ├── Module2.cpp
│   │   └── Module2.h
│   └── main.cpp               # 主程序入口
├── tests/                     # 单元测试
│   ├── CMakeLists.txt         # 测试的 CMake 配置文件
│   ├── test_module1.cpp       # 模块 1 的测试
│   └── test_module2.cpp       # 模块 2 的测试
├── examples/                  # 示例代码
│   ├── CMakeLists.txt         # 示例的 CMake 配置文件
│   ├── example1.cpp
│   └── example2.cpp
├── docs/                      # 文档
│   ├── Doxyfile               # Doxygen 配置文件（可选）
│   ├── design.md              # 设计文档
│   └── api/                   # API 文档（由 Doxygen 生成）
├── external/                  # 外部依赖（如第三方库）
│   ├── CMakeLists.txt         # 外部依赖的 CMake 配置文件
│   └── some_library/          # 第三方库
├── scripts/                   # 构建和部署脚本
│   ├── build.sh               # 构建脚本
│   ├── run_tests.sh           # 测试脚本
│   └── deploy.sh              # 部署脚本
└── build/                     # 构建输出目录（由 CMake 生成）
```

---

## **文件夹结构详解**

### **1. 根目录**
- **`CMakeLists.txt`**: 项目的根 CMake 配置文件，定义项目名称、版本、子目录等。
- **`README.md`**: 项目说明文档，包含项目简介、构建步骤、使用方法等。
- **`LICENSE`**: 项目许可证文件。
- **`.gitignore`**: Git 忽略文件，排除不需要版本控制的文件（如 `build/`）。
- **`.clang-format`**: 代码格式化配置文件（可选），用于统一代码风格。

---

### **2. `cmake/` 目录**
- **`FindMyLibrary.cmake`**: 自定义的 CMake Find 模块，用于查找外部依赖。
- **`MyProjectConfig.cmake`**: 项目配置文件，用于支持 `find_package(MyProject)`。

---

### **3. `include/` 目录**
- **`MyProject/`**: 项目的公共头文件，推荐使用命名空间（如 `MyProject::Module1`）。
  - **`Module1.h`**: 模块 1 的头文件。
  - **`Module2.h`**: 模块 2 的头文件。

---

### **4. `src/` 目录**
- **`Module1/`**: 模块 1 的源代码。
  - **`CMakeLists.txt`**: 模块 1 的 CMake 配置文件。
  - **`Module1.cpp`**: 模块 1 的实现文件。
  - **`Module1.h`**: 模块 1 的头文件（与 `include/` 中的头文件保持一致）。
- **`Module2/`**: 模块 2 的源代码。
  - **`CMakeLists.txt`**: 模块 2 的 CMake 配置文件。
  - **`Module2.cpp`**: 模块 2 的实现文件。
  - **`Module2.h`**: 模块 2 的头文件。
- **`main.cpp`**: 主程序入口。

---

### **5. `tests/` 目录**
- **`CMakeLists.txt`**: 测试的 CMake 配置文件。
- **`test_module1.cpp`**: 模块 1 的单元测试。
- **`test_module2.cpp`**: 模块 2 的单元测试。

---

### **6. `examples/` 目录**
- **`CMakeLists.txt`**: 示例代码的 CMake 配置文件。
- **`example1.cpp`**: 示例 1 的代码。
- **`example2.cpp`**: 示例 2 的代码。

---

### **7. `docs/` 目录**
- **`Doxyfile`**: Doxygen 配置文件，用于生成 API 文档。
- **`design.md`**: 设计文档，描述项目的架构和设计思路。
- **`api/`**: 生成的 API 文档（由 Doxygen 生成）。

---

### **8. `external/` 目录**
- **`CMakeLists.txt`**: 外部依赖的 CMake 配置文件。
- **`some_library/`**: 第三方库的源代码或子模块。

---

### **9. `scripts/` 目录**
- **`build.sh`**: 构建脚本，用于自动化构建。
- **`run_tests.sh`**: 测试脚本，用于运行单元测试。
- **`deploy.sh`**: 部署脚本，用于部署项目。

---

### **10. `build/` 目录**
- **构建输出目录**：由 CMake 生成，包含构建的中间文件和最终的可执行文件。

---

## **CMake 配置文件示例**

### **根目录的 `CMakeLists.txt`**
```cmake
cmake_minimum_required(VERSION 3.14)
project(MyProject VERSION 1.0 LANGUAGES CXX)

# 设置 C++ 标准
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 添加子目录
add_subdirectory(src)
add_subdirectory(tests)
add_subdirectory(examples)
add_subdirectory(external)

# 安装配置
include(GNUInstallDirs)
install(DIRECTORY include/ DESTINATION ${CMAKE_INSTALL_INCLUDEDIR})
install(TARGETS MyProject DESTINATION ${CMAKE_INSTALL_LIBDIR})
```

---

## **总结**
- **模块化设计**：将代码、测试、文档等分离，便于管理和维护。
- **清晰的依赖管理**：通过 CMake 管理项目依赖。
- **自动化构建**：通过 CMake 实现跨平台构建、测试和打包。
- **可扩展性**：支持未来功能的扩展和模块的添加。

通过以上标准文件夹结构和 CMake 配置，可以高效地管理和构建复杂的 C++ 项目。