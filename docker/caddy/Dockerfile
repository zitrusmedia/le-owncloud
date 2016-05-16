FROM alpine:3.2

LABEL caddy_version="0.8.3" architecture="amd64"

RUN apk add --update tar curl \
 && curl --silent --show-error --fail --location \
      --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
      "https://caddyserver.com/download/build?os=linux&arch=amd64" \
    | tar --no-same-owner -C /usr/bin/ -xz caddy \
 && rm -rf /var/cache/apk/* \
 && chmod 0755 /usr/bin/caddy \
 && /usr/bin/caddy -version

EXPOSE 80 443 2015

VOLUME /.caddy

VOLUME /srv
WORKDIR /srv

ADD files/etc/Caddyfile /etc/Caddyfile

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["-ca", "https://acme-staging.api.letsencrypt.org/directory", "-conf", "/etc/Caddyfile", "-agree"]
