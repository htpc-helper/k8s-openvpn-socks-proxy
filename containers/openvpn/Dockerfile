FROM alpine:latest

RUN apk update && \
  apk add --no-cache \
    bash \
    openvpn \
    iptables

RUN mkdir /vpn && \
  mkdir /init

COPY init.sh /init/

RUN chmod +x /init/init.sh

ENTRYPOINT "/init/init.sh"