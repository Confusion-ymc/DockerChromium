# DockerChromium (Pro)

在 Docker 中运行 Chromium 浏览器，内置全套中文字体库，并通过 noVNC (KasmVNC) 远程访问。

## 🚀 快速开始

```bash
git clone https://github.com/Confusion-ymc/DockerChromium.git
cd DockerChromium
# 第一次运行建议使用 --no-cache 确保获取最新字体层
docker compose build --no-cache
docker compose up -d
```

## 🌟 特色功能

- **完美中文支持**：内置文泉驿正黑、Noto CJK 字体，彻底告别中文“方块”显示。
- **Google 优化**：内置核心 Roboto 字体，优化 Google 搜索及 Google 全系服务的网页排版。
- **Emoji 全支持**：内置 Noto Color Emoji，支持全彩表情显示。
- **原生中文环境**：系统语言环境默认为 `zh_CN.UTF-8`，浏览器菜单及请求头默认为中文。
- **高性能前端**：基于 LinuxServer 维护的 KasmVNC 方案，相比传统方案更流畅且支持音频。

## 访问浏览器

1. **链接**：打开浏览器访问 `http://localhost:6080`
2. **凭据**：
   - 默认密码：`1234` (由 `PASSWORD` 环境变量控制)

## 配置选项

您可以直接在 `docker-compose.yml` 中修改以下配置：

| 变量名 | 默认值 | 说明 |
| :--- | :--- | :--- |
| `SCREEN_WIDTH` | `1920` | 容器内浏览器分辨率宽度 |
| `SCREEN_HEIGHT` | `1080` | 容器内浏览器分辨率高度 |
| `PASSWORD` | `1234` | 登录 Web 界面所需的密码 |
| `CHROME_CLI` | `https://www.google.com/` | 容器启动时默认加载的 URL |
| `LC_ALL` | `zh_CN.UTF-8` | 系统和浏览器的默认语言 |
| `TZ` | `Asia/Shanghai` | 容器内部时区（影响网页时间显示） |

## 管理维护

### 常见命令
- **重新构建并启动**：`docker compose up -d --build`
- **停止服务**：`docker compose down`
- **查看实时日志**：`docker compose logs -f`

### 数据持久化
所有浏览器数据（如书签、Cookie、历史记录）均保存在项目根目录下的 `./config` 文件夹中。
