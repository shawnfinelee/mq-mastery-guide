# 📚 GitHub Pages 部署指南

> 将《消息队列实战指南》发布到GitHub Pages的完整步骤

## 🚀 快速部署（推荐）

### 方法一：使用部署脚本（最简单）

```bash
# 1. 给脚本添加执行权限（已经完成）
chmod +x deploy.sh

# 2. 运行部署脚本（替换成你的GitHub用户名和仓库名）
./deploy.sh your-username your-repo-name

# 例如：./deploy.sh zhangsan mq-guide
```

### 方法二：手动部署

#### 第一步：初始化Git仓库

```bash
# 初始化Git仓库
git init

# 添加所有文件
git add .

# 提交代码
git commit -m "《消息队列实战指南》完整版本 - 9章42节内容"
```

#### 第二步：创建GitHub仓库

1. 访问 [GitHub](https://github.com) 并登录
2. 点击右上角 "+" → "New repository"
3. 填写仓库信息：
   - **Repository name**: `mq-guide` （或其他你喜欢的名字）
   - **Description**: `《消息队列实战指南》- 九章通MQ之道`
   - **Public** （必须选择Public才能使用免费的GitHub Pages）
   - 不勾选 "Add a README file"（因为已有README.md）

#### 第三步：连接远程仓库

```bash
# 添加远程仓库（替换成你的实际用户名和仓库名）
git remote add origin https://github.com/your-username/your-repo-name.git

# 推送到GitHub
git branch -M main
git push -u origin main
```

#### 第四步：启用GitHub Pages

1. 在GitHub仓库页面，点击 **Settings** 标签页
2. 在左侧菜单中找到 **Pages**
3. 在 "Source" 部分：
   - 选择 **Deploy from a branch**
   - Branch: 选择 **main**
   - Folder: 选择 **/ (root)**
4. 点击 **Save**

#### 第五步：等待部署完成

- GitHub会自动构建和部署你的网站
- 通常需要1-5分钟完成首次部署
- 部署完成后，你会看到绿色的 ✅ 标记
- 可以在Actions标签页查看部署进度

## 🌐 访问你的在线图书

部署完成后，你的图书将在以下地址可用：

```
https://your-username.github.io/your-repo-name/
```

## 🔧 更新内容

当你修改了书籍内容后，更新到GitHub Pages很简单：

```bash
# 添加修改的文件
git add .

# 提交修改
git commit -m "更新内容：描述你的修改"

# 推送到GitHub
git push origin main
```

GitHub Pages会自动重新部署，通常1-2分钟后就能看到更新。

## 📋 部署检查清单

在部署之前，请确认以下项目：

- [ ] ✅ 所有Markdown文件都使用UTF-8编码
- [ ] ✅ _sidebar.md中的链接都正确
- [ ] ✅ README.md中的徽章链接已更新为正确的仓库地址
- [ ] ✅ index.html中的repo配置已更新
- [ ] ✅ 所有章节文件都存在且可访问
- [ ] ✅ .nojekyll文件存在（禁用Jekyll处理）

## 🎨 个性化配置

### 更新仓库链接

记得在以下文件中更新你的实际GitHub仓库链接：

1. **README.md** 第5行：
   ```markdown
   [![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-在线阅读-blue)](https://your-username.github.io/your-repo-name/)
   ```

2. **index.html** 第16行：
   ```javascript
   repo: 'https://github.com/your-username/your-repo-name',
   ```

### 更新网站标题和描述

可以在 `index.html` 中修改：
- `<title>` 标签：网页标题
- `name` 配置：左上角显示的名称
- `<meta name="description">` 标签：SEO描述

## 🔍 常见问题

### Q: 部署后页面显示404或空白？
A: 检查以下几点：
- 确认仓库是Public的
- 确认Pages设置正确（main分支，根目录）
- 等待3-5分钟让部署完成
- 检查.nojekyll文件是否存在

### Q: Mermaid图表不显示？
A: GitHub Pages有时需要更长时间加载CDN资源，刷新几次页面即可。

### Q: 搜索功能不工作？
A: docsify的搜索功能需要页面完全加载后才能工作，确保网络连接正常。

### Q: 如何绑定自定义域名？
A: 在仓库根目录创建CNAME文件，内容为你的域名（如：mq.yourdomain.com）

## 🎉 部署成功！

恭喜！你的《消息队列实战指南》现在已经可以在线访问了！

可以分享给同事朋友：
- 📱 移动端适配良好
- 🔍 支持全文搜索  
- 📊 Mermaid图表完美显示
- 🎨 美观的docsify主题
- ⚡ CDN加速，访问迅速

---

*祝你的技术分享之旅一切顺利！* 🚀