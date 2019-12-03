FROM alpine:latest

RUN apk update && \
  apk add --no-cache \
    stunnel \
    ca-certificates

RUN mkdir /stunnel && \
  mkdir /init

COPY init.sh /init/

RUN chmod +x /init/init.sh

EXPOSE 1413

ENTRYPOINT "/init/init.sh"


