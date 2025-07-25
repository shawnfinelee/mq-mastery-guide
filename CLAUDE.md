# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## 项目概述

这是一个基于 Docsify 的《消息队列实战指南》技术书籍项目。项目结构采用传统的 Markdown 文档格式，通过 Docsify 框架提供在线阅读体验。

## 常用开发命令

### 环境准备
```bash
# 安装 Docsify CLI
make install

# 检查是否已安装
make check-install
```

### 开发服务器
```bash
# 启动本地开发服务器 (端口 3000)
make serve
# 或者使用别名
make dev

# 快速启动 (一键完成所有初始化和启动)
make quick-start
```

### 项目管理
```bash
# 初始化项目
make init

# 更新侧边栏导航
make update-sidebar

# 查看项目状态
make status

# 构建部署文件
make build

# 清理构建文件
make clean

# 显示帮助信息
make help
```

## 代码架构

### 文档结构
- **README.md**: 项目主页，介绍书籍特色和章节概览
- **00.目录.md**: 详细的九章修炼体系目录，包含完整章节结构
- **第X章-xxx.md**: 各章节内容文件，按顺序编号
- **_sidebar.md**: Docsify 侧边栏导航配置，通过 `make update-sidebar` 自动生成
- **index.html**: Docsify 主配置文件，包含主题、插件和搜索配置

### 配置文件
- **Makefile**: 项目自动化脚本，包含所有开发和部署命令
- **.nojekyll**: GitHub Pages 部署所需的空文件
- **context/prompt.md**: 内容写作规范和要求，定义了书籍的写作标准

### Docsify 特性配置
- 使用 Vue 主题
- 启用侧边栏导航 (`loadSidebar: true`)
- 支持搜索功能
- 集成代码复制插件
- 支持 Mermaid 图表渲染

## 内容编辑规范

### 写作要求 (基于 context/prompt.md)
1. 严格按照目录结构编写，保持章节顺序
2. 每章包含学习目标、正文内容和总结要点
3. 写作风格：通俗易懂、深入浅出、逻辑清晰、诙谐幽默
4. 配备 Mermaid 图表说明核心概念
5. 使用表格对比不同方案
6. 提供伪代码示例，避免完整类定义

### 代码示例标准
- 优先使用伪代码
- 聚焦核心逻辑，省略样板代码
- 不需要 include/require 引用语句
- 重点展示算法和业务逻辑

## 开发工作流

1. **启动开发环境**: `make quick-start`
2. **编辑文档**: 直接修改对应的 .md 文件
3. **更新导航**: `make update-sidebar` (如有新增章节)
4. **预览效果**: 浏览器访问 http://localhost:3000
5. **构建部署**: `make build` 生成 dist/ 目录用于部署

## 项目特点

- **九章体系**: 完整的消息队列学习路径，从入门到实战
- **多媒体支持**: 集成 Mermaid 图表、代码高亮、搜索功能
- **自动化管理**: 通过 Makefile 实现一键开发和部署
- **响应式设计**: 支持多端阅读体验