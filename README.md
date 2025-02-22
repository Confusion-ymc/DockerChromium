# DockerChromium
Run chromium in docker, view by noVNC


```shell
docker build -t vnc-chromium .

docker run -p 6080:6080 -e WINDOW_SIZE=900x600 -e VNC_PASS=1234 --name chromium-test vnc-chromium
```
