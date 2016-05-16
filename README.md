Let's encrypt TLS enabled owncloud container
============================================

A composed owncloud container with mariadb and [caddy server](https://caddyserver.com/). Caddy acts as a reverse proxy with automatically enabled https for owncloud. The certificates are automatically provisioned and renewed by [Let’s Encrypt](https://letsencrypt.org/).

### 1. Clone repository

Clone this project to a destination on your server, e.g. ~/owncloud

### 2. Modify environment

Make sure you setup the docker compose environment for this project correctly. You can find an env-example file in the root directory which must be copied to .env. And please please please change the mariadb passwords in that env file before using it in production! You must also provide a valid host- and domainname as well as an email address, otherwise the let's encrypt tls certificate creation will fail.

```bash
cp env-example .env
vim .env
```

### 3. Configure caddy

Copy the example Caddyfile and modify it to configure the caddy server successfully.

```bash
cp docker/caddy/files/etc/Caddyfile.example docker/caddy/files/etc/Caddyfile
vim docker/caddy/files/etc/Caddyfile
```

Make sure you're replacing the hostname acme.example.com! That's all you need to change here.

### 4. Run docker containers

```bash
docker-compose up -d --build
```
