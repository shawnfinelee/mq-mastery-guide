# 消息队列实战指南 - Docsify 自动化脚本
# 使用方法: make [target]

.PHONY: help install init serve build clean status update-sidebar quick-start deploy

# 默认目标
.DEFAULT_GOAL := help

# 配置变量
PORT := 3000

help: ## 显示帮助信息
	@echo "消息队列实战指南 - Docsify 自动化脚本"
	@echo ""
	@echo "可用命令:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-15s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

install: ## 安装 Docsify CLI
	@echo "📦 安装 Docsify CLI..."
	npm install -g docsify-cli
	@echo "✅ Docsify CLI 安装完成"

check-install: ## 检查 Docsify 是否已安装
	@command -v docsify >/dev/null 2>&1 || { echo "❌ Docsify CLI 未安装，请先运行 make install"; exit 1; }

init: check-install ## 初始化 Docsify 项目
	@echo "🚀 初始化 Docsify 项目..."
	@echo "创建必要文件..."
	@touch .nojekyll
	@echo "✅ Docsify 项目初始化完成"

serve: check-install ## 启动本地开发服务器
	@echo "🌐 启动 Docsify 服务器 (端口: $(PORT))..."
	@echo "📖 访问地址: http://localhost:$(PORT)"
	@echo "⏹️  按 Ctrl+C 停止服务"
	docsify serve . --port $(PORT)

dev: serve ## 启动开发服务器 (serve 的别名)

build: ## 构建用于部署的文件
	@echo "🔨 准备部署文件..."
	@mkdir -p dist
	@cp -r *.md *.html .nojekyll _sidebar.md dist/ 2>/dev/null || true
	@echo "✅ 构建完成，文件位于 dist/ 目录"

clean: ## 清理生成的文件
	@echo "🧹 清理文件..."
	@rm -rf dist/
	@echo "✅ 清理完成"

status: ## 显示项目状态
	@echo "📊 项目状态:"
	@echo "当前目录: $(PWD)"
	@echo "Markdown 文件:"
	@ls -la *.md 2>/dev/null || echo "  无 Markdown 文件"
	@echo "Docsify 文件状态:"
	@test -f "index.html" && echo "  ✅ index.html" || echo "  ❌ index.html (缺失)"
	@test -f ".nojekyll" && echo "  ✅ .nojekyll" || echo "  ❌ .nojekyll (缺失)"
	@test -f "_sidebar.md" && echo "  ✅ _sidebar.md" || echo "  ❌ _sidebar.md (缺失)"
	@test -f "README.md" && echo "  ✅ README.md" || echo "  ❌ README.md (缺失)"

update-sidebar: ## 自动更新侧边栏导航
	@echo "🔄 更新侧边栏导航..."
	@echo "* [首页](README.md)" > _sidebar.md
	@echo "* [目录](00.目录.md)" >> _sidebar.md
	@ls 第*章*.md 2>/dev/null | sort | while read file; do \
		title=$$(echo "$$file" | sed 's/\.md$$//'); \
		echo "* [$$title]($$file)" >> _sidebar.md; \
	done || true
	@echo "✅ 侧边栏导航已更新"

quick-start: ## 一键启动 (检查安装 + 初始化 + 更新导航 + 启动服务)
	@make check-install || make install
	@make init
	@make update-sidebar
	@make serve

deploy: ## 部署到GitHub Pages
	@echo "🚀 部署到GitHub Pages..."
	@chmod +x deploy.sh
	@./deploy.sh
