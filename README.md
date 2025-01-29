# painterest-docker-ghcr
Images of Painterest updated daily hosted on GHCR

This repo fetches the content of Painterest everyday from the official <a href="https://codeberg.org/thirtysix/painterest">repo</a> and build+publish on ghcr.io 
Useful if you wanna track the updates with <a href="https://getwud.github.io/wud/#/">WUD</a> for example

Usage:
```shell
$ docker run --restart unless-stopped -p 8080:8080 -d --name "painterest" ghcr.io/gitgitro/painterest
```

Or with the docker compose file provided:
```shell
services:
painterest:
    image: 'ghcr.io/gitgitro/painterest:latest'
    ports:
        - '8889:8889'
    container_name: painterest
    restart: unless-stopped
```

To build from scratch:
```shell
$ docker build . -t ghcr.io/gitgitro/painterest:latest
```