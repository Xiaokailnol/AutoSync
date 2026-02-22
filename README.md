# 🚀 AutoSync - OpenWRT 插件自动同步神器

> 解放双手，让你的 OpenWRT 插件库始终保持最新状态！

[![GitHub Stars](https://img.shields.io/github/stars/Xiaokailnol/AutoSync.svg?style=for-the-badge&color=yellow)](https://github.com/Xiaokailnol/AutoSync/stargazers)
[![GitHub License](https://img.shields.io/github/license/Xiaokailnol/AutoSync.svg?style=for-the-badge&color=blue)](https://github.com/Xiaokailnol/AutoSync/blob/main/LICENSE)
[![GitHub Issues](https://img.shields.io/github/issues/Xiaokailnol/AutoSync.svg?style=for-the-badge&color=orange)](https://github.com/Xiaokailnol/AutoSync/issues)
[![GitHub Pull Requests](https://img.shields.io/github/issues-pr/Xiaokailnol/AutoSync.svg?style=for-the-badge&color=green)](https://github.com/Xiaokailnol/AutoSync/pulls)

---

## 📖 项目简介

AutoSync 是一款专为 OpenWRT 打造的插件自动同步工具，旨在帮助开发者和爱好者轻松维护和更新他们的插件库。通过自动化的同步流程，你可以告别手动更新的繁琐，专注于插件的开发和优化。

无论是个人插件库还是团队协作项目，AutoSync 都能提供稳定、高效的同步服务，确保你的插件始终与上游仓库保持同步，同时支持自定义同步规则和增量更新。

---

## ✨ 核心特性

- 🤖 **全自动同步**：支持定时触发、Webhook 触发等多种同步方式，无需人工干预
- 📦 **增量更新**：只同步变化的内容，节省带宽和时间
- 🎯 **多源支持**：同时同步多个上游插件仓库到本地
- ⚙️ **高度可配置**：灵活的配置文件，支持自定义同步规则、过滤条件
- 📊 **实时监控**：同步状态实时反馈，详细的日志记录便于问题排查
- 🔒 **安全可靠**：GPLv3 开源许可证，代码透明可审计
- 🐳 **容器化支持**：Docker 镜像一键部署，跨平台运行

---

## 🚀 快速开始

### 🔧 安装方式

#### 方法一：直接运行（推荐）
```bash
# 克隆仓库
git clone https://github.com/Xiaokailnol/AutoSync.git
cd AutoSync

# 安装依赖
pip install -r requirements.txt

# 启动服务
python main.py
```

#### 方法二：Docker 部署
```bash
# 拉取镜像
docker pull xiaokailnol/autosync:latest

# 运行容器
docker run -d \
  --name autosync \
  -p 8000:8000 \
  -v $(pwd)/config:/app/config \
  -v $(pwd)/plugins:/app/plugins \
  xiaokailnol/autosync:latest
```

### ⚙️ 配置说明

复制并编辑配置文件 `config/config.yaml`：

```yaml
# 基础配置
base:
  sync_interval: 3600  # 同步间隔（秒），0 表示禁用定时同步
  log_level: INFO       # 日志级别：DEBUG, INFO, WARNING, ERROR

# 上游仓库配置
upstream_repos:
  - name: openwrt/packages
    url: https://github.com/openwrt/packages.git
    branch: master
    sync_path: plugins/openwrt
    filters:
      include:
        - net/
        - utils/
      exclude:
        - deprecated/

# 本地存储配置
local_storage:
  plugins_dir: ./plugins
  cache_dir: ./cache
  max_cache_size: 1024  # 缓存最大大小（MB）

# Webhook 配置（可选）
webhook:
  enable: true
  port: 8000
  secret: your_webhook_secret_here
```

### 🎮 使用指南

#### 手动触发同步
```bash
python main.py --sync
```

#### 查看同步日志
```bash
tail -f logs/autosync.log
```

#### 查看当前状态
```bash
python main.py --status
```

---

## 📚 高级功能

### 🎯 自定义过滤规则

支持基于路径的正则表达式过滤：

```yaml
filters:
  include:
    - ^net/.*
    - ^utils/.*
  exclude:
    - ^deprecated/.*
    - ^docs/.*
```

### 🔄 增量同步策略

AutoSync 会自动检测上游仓库的变化，只同步有更新的插件：
- 基于 Git commit history 检测变化
- 支持文件级别的增量同步
- 可配置保留历史版本数量

### 📊 监控与告警

支持通过 Webhook 发送同步结果通知：
- 同步成功/失败通知
- 异常状态告警
- 支持企业微信、钉钉、Slack 等多种通知渠道

---

## 🤝 贡献指南

我们非常欢迎社区贡献！无论是代码、文档、bug 报告还是功能建议，都可以通过以下方式参与：

1. Fork 本仓库
2. 创建特性分支：`git checkout -b feature/AmazingFeature`
3. 提交更改：`git commit -m 'Add some AmazingFeature'`
4. 推送到分支：`git push origin feature/AmazingFeature`
5. 打开 Pull Request

### 📋 开发规范

- 遵循 PEP 8 代码规范
- 为新功能编写测试用例
- 确保所有测试通过
- 更新相关文档

---

## 📄 许可证

本项目采用 GNU General Public License v3.0 许可证，详见 [LICENSE](LICENSE) 文件。

---

## 🙏 致谢

感谢以下开源项目和社区的支持：

- [OpenWRT](https://openwrt.org/) - 优秀的开源路由器操作系统
- [GitPython](https://gitpython.readthedocs.io/) - Git 操作 Python 库
- [PyYAML](https://pyyaml.org/) - YAML 解析库
- [FastAPI](https://fastapi.tiangolo.com/) - 现代快速的 Web 框架

---

## 📞 联系方式

- 项目地址：[https://github.com/Xiaokailnol/AutoSync](https://github.com/Xiaokailnol/AutoSync)
- Issue 反馈：[https://github.com/Xiaokailnol/AutoSync/issues](https://github.com/Xiaokailnol/AutoSync/issues)
- 邮件咨询：xiaokailnol@example.com

---

⭐ 如果这个项目对你有帮助，请给个 Star 支持一下！
