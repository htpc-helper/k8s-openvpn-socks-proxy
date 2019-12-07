FROM golang:alpine AS builder

ENV VERSION=1.3.2
ENV CGO_ENABLED 0

RUN apk update && \
  apk add --no-cache \
    git && \
  go get github.com/jpillora/chisel && \
  cd /go/src/github.com/jpillora/chisel && \
  go build -o /usr/bin/chisel main.go && \
  chmod +x /usr/bin/chisel

FROM alpine:latest

RUN mkdir /init
COPY --from=builder /usr/bin/chisel /usr/bin/
COPY init.sh /init/
RUN chmod +x /init/init.sh

EXPOSE 8080

ENTRYPOINT /init/init.sh
