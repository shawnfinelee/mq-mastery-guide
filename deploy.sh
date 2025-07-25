#!/bin/bash

# 《消息队列实战指南》GitHub Pages 部署脚本
# 使用方法: ./deploy.sh your-username your-repo-name

echo "🚀 开始部署《消息队列实战指南》到GitHub Pages..."

# 检查参数
if [ $# -ne 2 ]; then
    echo "❌ 错误: 请提供GitHub用户名和仓库名"
    echo "使用方法: ./deploy.sh your-username your-repo-name"
    exit 1
fi

USERNAME=$1
REPO_NAME=$2

echo "📝 用户名: $USERNAME"
echo "📝 仓库名: $REPO_NAME"

# 1. 初始化Git仓库（如果尚未初始化）
if [ ! -d ".git" ]; then
    echo "🔧 初始化Git仓库..."
    git init
else
    echo "✅ Git仓库已存在"
fi

# 2. 添加所有文件
echo "📦 添加文件到Git..."
git add .

# 3. 提交代码
echo "💾 提交代码..."
git commit -m "《消息队列实战指南》完整版本

✨ 主要特性:
- 完整的9章42节内容，总计14,393行
- 使用docsify框架，支持搜索和代码复制
- 56个mermaid图表，可视化效果优秀
- 严格遵循伪代码规范，技术准确性高
- 通俗易懂的写作风格，适合学习和参考

📚 章节内容:
- 第一章: 初识MQ - 解耦、异步、削峰三大利器
- 第二章: 核心概念 - 掌握MQ的基本功
- 第三章: 可靠性保障 - 确保消息万无一失
- 第四章: 性能优化 - 让MQ飞起来
- 第五章: 高可用设计 - 构建永不宕机的系统
- 第六章: 进阶特性 - 解决复杂业务场景
- 第七章: 产品选型 - 选择最适合的MQ利器
- 第八章: 实战应用 - 典型场景深度剖析
- 第九章: 生产实践 - 从开发到上线的完整指南

🎯 技术栈: Docsify + Mermaid + GitHub Pages
📖 适用人群: 开发工程师、架构师、技术管理者"

# 4. 设置远程仓库
echo "🌐 设置远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/$USERNAME/$REPO_NAME.git

# 5. 推送到GitHub
echo "🚀 推送到GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ 部署完成！"
echo ""
echo "📖 接下来的步骤:"
echo "1. 访问你的GitHub仓库: https://github.com/$USERNAME/$REPO_NAME"
echo "2. 进入 Settings → Pages"
echo "3. 选择 Source: Deploy from a branch"
echo "4. 选择 Branch: main, Folder: / (root)"
echo "5. 点击 Save"
echo ""
echo "🌟 部署完成后，你的图书将在以下地址可用:"
echo "   https://$USERNAME.github.io/$REPO_NAME/"
echo ""
echo "📝 如果是第一次部署，可能需要等待1-5分钟才能访问。"
echo "🎉 恭喜！你的《消息队列实战指南》即将上线！"