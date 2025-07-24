FROM caddy:builder AS builder

RUN xcaddy build --with github.com/caddyserver/cache-handler

FROM caddy

COPY --from=builder /usr/bin/caddy /usr/bin/caddy

COPY config/Caddyfile /etc/caddy/Caddyfile
RUN caddy validate --config /etc/caddy/Caddyfile
COPY html/ /srv/www
