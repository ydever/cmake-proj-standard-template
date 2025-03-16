# cmake项目标准模板（ cmake project stadard template ）

## [中文文档](README.md) | [英文文档](docs/readme/README_EN.md) (英文文档暂未翻译，待补充)

### 目录

1. [贡献者](#贡献者contributors)
2. [项目介绍](#项目介绍)
3. [参考资源](#参考资源)
4. [项目结构](#项目结构)
5. [使用方式](#使用方式)

---

### 贡献者（Contributors）

1. 如果你对使用cmake构建系统构建`c/cpp`项目有专业和独特的见解，欢迎你给本项目提出优秀的建议并参与包括本项目以外的其它相关项目的建设，我将在每个cmake相关的项目README开始地方列出参与对应项目贡献者的名单以示敬意。
2. 项目贡献方式：请参考`GitHub`平台代码贡献文档 [CONTRIBUTING](docs/github/CONTRIBUTING.md)
3. 利用`cmake`进行项目构建，除了构建`c/cpp`项目外，cmake已经扩展到了许多其它语言项目的构建，如果您对使用`cmake`进行其它语言项目的构建有一定使用和经验，欢迎在 [cmake支持语言文档](docs/cmak-docs/cmake支持语言文档/cmake支持语言介绍.md) 做出您宝贵的文档贡献，我将适时基于其它语言的了解搭建对应语言的项目标准模板
4. contributors
   
    | 贡献者 | 介绍 | 其它 |
    | :-:   | :-   | :-   |
    | yang  | 本项目的作者，做事纯粹 | ... |
    | ...   | ... | ... |

    期待各位大佬的指导和贡献

---

### 项目介绍

1. 本项目仓库为cmake构建系统搭建的标准`c/cpp`项目模板，旨在简化cmake项目搭建流程，快速应用于项目开发中。
2. 本项目托管平台主要为`GitHub`，项目地址：[cmake-cpp-standard-template](https://github.com/ydever/cmake-proj-standard-template)
3. 如在使用`github`期间遇到网络问题，请检查网络状态并科学配置网络，后续有时间也会考虑配置在国内的 [gitee] (https://gitee.com/) 代码托管平台同步项目
4. 本项目需要开发者具备一定的c/c++、cmake、git等基础开发知识和使用能力，欢迎相互交流，但目前暂不考虑维护一个交流平台，如有问题请在github或者其它本项目的托管平台的issue下留言。佛系回复。
5. 本仓库项目还有诸多未完善之处，会持续更新中，敬请关注和贡献您宝贵的修改建议和经验。

---

### 项目结构

```bash
ProjectName/                   # 项目根目录
├── CMakeLists.txt             # 项目主 CMake 配置文件
├── CMakePresets.json          # 项目预设配置文件，在cmake 3.19后新增功能
├── README.md                  # 项目说明文档
├── LICENSE                    # 项目许可证文件
├── .gitignore                 # Git 忽略文件
├── .clang-format              # 代码格式化配置文件（可选）
├── ...                        # 其它构建相关的配置文件
├── .github/                   # GitHub 工作流相关配置（如 CI/CD）
│   └── workflows/
│       └── ci.yml             # GitHub Actions 配置文件
├── cmake/                     # 自定义 CMake 模块和脚本
│   ├── FindMyLibrary.cmake    # 自定义 Find 模块（可选）
│   └── MyProjectConfig.cmake  # 项目配置文件（用于安装）
├── include/                   # 公共头文件
│   └── common/                # 项目公共头文件（推荐使用命名空间）
│       ├── Module1.h
│       └── Module2.h
├── src/                       # 项目源代码
│   ├── Module1/               # 模块 1
│   │   ├── CMakeLists.txt     # 模块 1 的 CMake 配置文件
│   │   ├── include            # 模块 1 的头文件目录
│   │   │   ├── xxx1.h
│   │   │   └── xxx2.h
│   │   ├── source             # 模块 1 的源文件目录
│   │   │   ├── xxx1.cpp
│   │   │   └── xxx2.cpp
│   │   └── Module1.cpp        # 模块 1 的入口文件
│   ├── Module2/               # 模块 2
│   │   ├── CMakeLists.txt     # 模块 2 的 CMake 配置文件
│   │   ├── include            # 模块 2 的头文件目录
│   │   │   ├── xxx1.h
│   │   │   └── xxx2.h
│   │   ├── source             # 模块 2 的源文件目录
│   │   │   ├── xxx1.cpp
│   │   │   └── xxx2.cpp
│   │   └── Module2.cpp        # 模块 2 的入口文件
│   └── main.cpp               # 主程序入口
├── tests/                     # 单元测试
│   ├── CMakeLists.txt         # 测试的 CMake 配置文件
│   ├── test_module1           # 模块 1 的测试
│   │   └── test_module1.cpp
│   └── test_module2           # 模块 2 的测试
│       └── test_module1.cpp
├── examples/                  # 示例代码
│   ├── CMakeLists.txt         # 示例的 CMake 配置文件
│   ├── example1
│   │   └── example1.cpp
│   └── example2
│       └── example2.cpp
├── docs/                      # 文档
│   ├── Doxyfile               # Doxygen 配置文件（可选）
│   ├── design.md              # 设计文档
│   ├── ...                    # 其它设计文档
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

### 使用方式

- 环境准备
  - windows
    - 使用`msvc`、`clang`编译器进行开发，请安装`visual studio \<version\>`所需版本的IDE
    - 使用`mingw`编译器进行开发，请下载所需的`mingw`版本进行安装
    - 其它编译器，请配置对应的工具链环境
  - linux
    - 使用gnu或者llvm-clang，请安装对应的工具链环境
  - 根据所使用的编译器修改对应`Cmakepresets.json`配置文件中对应的生成器配置
  - 安装`git`版本管理工具
  - 针对不同平台安装`cmake`软件
  - 针对喜欢的构建工具安装`make`,`ninja`等构建工具
  - 如果是基于vscode进行开发，配置好相应的cmake-tools插件
  - 关于vscode中配置c/c++开发环境，请查阅相关资料，本项目暂未提供.vscode关联项目配置文件
  - 对应的配置和安装流程和步骤会在有闲的时候进行补充...

- 使用步骤

    ```md
    1. 克隆本项目到本地计算机开发目录，并修改为自己项目的名称
    > cd path/to/<your-dir>
    > git clone https://github.com/ydever/cmake-proj-standard-template.git [your-project-name]
    ```

    ```md
    2. 在项目根目录打开控制台终端，检查模板项目是否可以直接构建，因为本项目模板使用的是cmake预设的方式进行构建，所以后续工具链等相关预设的配置请在`CMakePrests.json`文件中进行配置
    > ./
    > cmake --preset debug
    > cmake --build --preset debug-build
    ```

    ```md
    3. 如果构建成功，则后续就开始你的cmake项目开发之旅吧，如果构建失败，请检查你的配置环境是否正确，或者在issue留言问题，佛系回答。
    ```

---

### 参考资源
[cmake.org](https://cmake.org/) - cmake官方网站  
[CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html) - cmake官方教程  
[cmake-cookbook](https://github.com/dev-cafe/cmake-cookbook) - cmake优秀教程  
[Bjarne Stroustrup's homepage](https://www.stroustrup.com/) - c++创始人的个人网站  
[cppreference_en](https://en.cppreference.com/w/cpp) - cpp英文参考网站  
[cppreference_zh](https://zh.cppreference.com/w/cpp) - cpp中文参考网站  
待补充...
