# Betriebssysteme 1

This container is built for students with a Mac M1 / M2 (ARM-Architecture).
It contains necessary tools for the exercises "Betriebssysteme 1".

## Requirements

- Installed Docker [Docker Docs](https://docs.docker.com/desktop/install/mac-install/) (pay attention to "Mac with Apple silicon")
- Installed Visual Studio Code with Dev Containers extension (recommended)

## How to run

### Docker plain

`docker run -d --name bsys1 registry.gitlab.ost.ch:45023/dominic.klinger/betriebssysteme-1-docker:latest sleep infinity`

### Docker compose

`mkdir -p exercises && docker compose up -d`

### How to open shell plain

`docker exec -it bsys1 /bin/bash`

### How to open shell Docker compose

`docker compose exec -it bsys1 /bin/bash`

## How to code

- Open Command Palette (Cmd+Shift+P)
- Execute in Quick Open (Cmd+P) to install Dev Containers extension: `ext install ms-vscode-remote.remote-containers` or via marketplace https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers
- Select `Dev Containers: Attach to running Container ...`
- Select `bsys1` container
