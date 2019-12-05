FROM golang:alpine AS builder

RUN apk update && \
  apk add --no-cache \
    git

RUN mkdir /go/src/proxy/

COPY proxy.go /go/src/proxy/

RUN cd /go/src/proxy/ && \
  go get github.com/armon/go-socks5 && \
  go build proxy.go && ls -l && find / -name proxy

FROM alpine:latest

COPY --from=builder /go/src/proxy/proxy /usr/bin/

RUN chmod +x /usr/bin/proxy

EXPOSE 1080

ENTRYPOINT proxy
