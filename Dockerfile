FROM hubporter/xcaddy AS builder

RUN xcaddy build --with github.com/caddyserver/forwardproxy@caddy2=github.com/klzgrad/forwardproxy@naive && \
    go clean -cache -modcache


FROM alpine:latest

RUN apk --no-cache add tzdata

ENV TZ=Asia/Shanghai \
    XDG_DATA_HOME=/opt/naive

WORKDIR ${XDG_DATA_HOME}

COPY --from=builder /go/caddy /usr/local/bin/naive

ENTRYPOINT [ "naive", "run", "--config", "config.json" ]
