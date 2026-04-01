FROM lscr.io/linuxserver/chromium:latest

# 配置国内镜像源并安装中文字体/常用 Web 字体
RUN \
  sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list.d/debian.sources && \
  apt-get update && \
  apt-get install -y \
    fonts-wqy-zenhei \
    fonts-wqy-microhei \
    fonts-noto-cjk \
    fonts-noto-color-emoji \
    fonts-liberation \
    fonts-roboto && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/*
