FROM debian:bookworm

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=zh_CN.UTF-8 \
    LANGUAGE=zh_CN.UTF-8 \
    LC_ALL=zh_CN.UTF-8 \
    DISPLAY=:0

RUN apt-get update && \
    apt-get install -y \
      --no-install-recommends \
      net-tools \
      socat \
      novnc \
      supervisor \
      x11vnc \
      xvfb \
      wget \
      locales \
      chromium \
      fonts-droid-fallback \
      fonts-wqy-zenhei \
      fonts-wqy-microhei \
      fonts-noto-cjk \
      fonts-noto-color-emoji \
      fonts-liberation \
      fonts-roboto \
      fontconfig && \
    sed -i '/zh_CN.UTF-8/s/^# //g' /etc/locale.gen && \
    locale-gen && \
    fc-cache -fv && \
    ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    

EXPOSE 6080 9222

COPY entrypoint.sh /entrypoint.sh

RUN chmod +x entrypoint.sh

RUN mkdir -p /root/.vnc

CMD [ "/bin/sh", "/entrypoint.sh" ]
