#!/bin/bash

# 《消息队列实战指南》GitHub Pages 部署脚本
# 使用方法: ./deploy.sh

echo "🚀 开始部署《消息队列实战指南》到GitHub Pages..."

# 设置GitHub用户名和仓库名
USERNAME="shawnfinelee"
REPO_NAME="mq-mastery-guide"

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
git commit -m "《消息队列实战指南》更新"

# 4. 设置远程仓库并推送到GitHub
echo "🔗 设置远程仓库..."
git remote remove origin 2>/dev/null || true
git remote add origin https://github.com/$USERNAME/$REPO_NAME.git

echo "🚀 推送到GitHub..."
git branch -M main
git push -u origin main

echo ""
echo "✅ 部署完成！"
echo "🌟 部署完成后，你的图书将在以下地址可用:"
echo "   https://$USERNAME.github.io/$REPO_NAME/"