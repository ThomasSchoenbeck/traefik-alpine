FROM alpine:3.8

COPY traefik_linux-amd64 /opt/traefik/traefik
COPY traefik.toml /opt/traefik

RUN addgroup -S traefik && adduser -S -G traefik traefik \
 && chmod -R 777 /opt/traefik \
 && chown -R traefik:traefik /opt/traefik

USER traefik

EXPOSE 9000 8080

CMD ["/opt/traefik/traefik", "--configFile=/opt/traefik/traefik.toml"]