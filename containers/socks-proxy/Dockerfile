FROM golang:alpine AS builder

RUN apk update && \
  apk add --no-cache \
    git

COPY proxy.go /go/

RUN go get github.com/armon/go-socks5 && \
  go build proxy.go

FROM alpine:latest

COPY --from=builder /go/proxy /usr/bin/

RUN chmod +x /usr/bin/proxy

EXPOSE 1080

ENTRYPOINT proxy
