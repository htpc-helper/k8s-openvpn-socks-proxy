FROM alpine:latest

COPY caddy /usr/bin/
RUN chmod +x /usr/bin/caddy
RUN mkdir /etc/caddy
COPY Caddyfile /etc/caddy

ENTRYPOINT /usr/bin/caddy
