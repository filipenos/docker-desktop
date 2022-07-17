FROM debian:latest

RUN apt update && \
  DEBIAN_FRONTEND=noninteractive apt install -y --no-install-recommends \
  lxde desktop-file-utils vim git wget curl tar ca-certificates scrot \
  net-tools procps python3 python3-numpy \
  tigervnc-standalone-server tigervnc-common

RUN git clone https://github.com/novnc/noVNC.git /opt/noVNC

RUN ln -s /opt/noVNC/vnc.html /opt/noVNC/index.html

ENV VNC_PASSWD=123456

ENV DISPLAY_SIZE=1360x768

WORKDIR /root

EXPOSE 6080 5900

COPY start.sh /opt/start.sh

ENTRYPOINT [ "/opt/start.sh" ]