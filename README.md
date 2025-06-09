# DockerChromium

在 Docker 中运行 Chromium 浏览器，并通过 noVNC 远程访问

## 🚀 快速开始

```bash
git clone https://github.com/Confusion-ymc/DockerChromium.git
cd DockerChromium
docker compose up -d
```

## 使用方式

### 方法1：Docker 原生命令
```bash
# 构建镜像
docker build -t vnc-chromium .

# 运行容器
docker run -p 6080:6080 \
  -e WINDOW_SIZE=1920x1080 \
  -e VNC_PASS=1234 \
  -v ./data:/data
  --name chromium-test \
  vnc-chromium
```

### 方法2：Docker Compose（推荐）
```bash
docker compose up -d
```

## 访问浏览器
1. 打开浏览器访问：http://localhost:6080
2. 输入 VNC 密码：`1234`

## 配置选项

### 环境变量
| 变量名         | 默认值    | 说明                      |
|----------------|-----------|---------------------------|
| `WINDOW_SIZE`  | 1920x1080   | 浏览器窗口分辨率（宽x高） |
| `VNC_PASS`     | 1234      | VNC 连接密码              |

### 数据持久化
- `./data:/data`：将浏览器数据持久化保存在主机上的 ./data 目录
  
### 端口映射
- `6080`: noVNC Web 访问端口

## 管理命令

### 停止服务
```bash
# Docker 原生方式
docker stop chromium-test

# Compose 方式
docker compose down
```

### 查看日志
```bash
# Docker 原生方式
docker logs chromium-test

# Compose 方式
docker compose logs
```
