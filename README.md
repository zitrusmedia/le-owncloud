Let's encrypt TLS enabled owncloud container
============================================

A composed owncloud container with mariadb and [caddy server](https://caddyserver.com/). Caddy acts as a reverse proxy with automatically enabled https for owncloud. The certificates are automatically provisioned and renewed by [Let’s Encrypt](https://letsencrypt.org/).

### 1. Clone repository

Clone this project to a destination on your server, e.g. ~/owncloud

### 2. Modify environment

Make sure you setup the docker compose environment for this project correctly by copying the env-example to .env. Please change the mariadb passwords in that env file before using it in production!

```bash
cp env-example .env
vim .env
```

### 3. Configure caddy

Configure caddy. You can copy the example file and edit it.

```bash
cp docker/caddy/files/etc/Caddyfile.example docker/caddy/files/etc/Caddyfile
vim docker/caddy/files/etc/Caddyfile
```

Make sure you're replacing the hostname acme.example.com and updating the tls email address used to create the let's encrypt certificates.

### 4. Run docker containers

```bash
docker-compose up -d --build
```
