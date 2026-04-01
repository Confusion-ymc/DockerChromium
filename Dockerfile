FROM lscr.io/linuxserver/chromium:latest

# 安装中文字体和常用 Web 字体
RUN \
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
