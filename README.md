# MAZLABZ HomeHub

**Containerised home-lab integration around Home Assistant, MQTT, networking and local services.**

[![Status](https://img.shields.io/badge/status-integrated%20homelab%20prototype-blue)](PROJECT_STATUS.md)
![Docker](https://img.shields.io/badge/container-Docker%20Compose-blue)
![Home Assistant](https://img.shields.io/badge/automation-Home%20Assistant-blue)
![MQTT](https://img.shields.io/badge/messaging-MQTT-blue)

> **Maturity: Integrated homelab prototype.** This repository is real systems-integration work, but its configuration is environment-specific and should not be treated as a turnkey production platform. See [PROJECT_STATUS.md](PROJECT_STATUS.md).

## What it is

HomeHub is an earlier MAZLABZ infrastructure project that brought multiple self-hosted services into one Docker/Compose-managed environment. The useful engineering story is not any single container; it is the work of making **automation, messaging, routing, tunnelling, media and local services coexist as one system**.

## Architecture

```text
                 local network / clients
                          │
                    reverse proxy
                          │
         ┌────────────────┼────────────────┐
         │                │                │
 Home Assistant       dashboard        media/services
         │
       MQTT
         │
 automation / device integrations

 optional remote access paths
         │
 VPN / tunnel components
```

The exact service set evolved over time. `docker-compose.yml` and the repository history are the implementation source of truth for a given revision.

## Demonstrated engineering work

- Docker and Docker Compose service orchestration;
- Home Assistant integration;
- MQTT broker/service integration;
- reverse-proxy and routing concepts;
- Cloudflare-tunnel/VPN experimentation;
- health checks and container lifecycle management;
- host/data-volume configuration;
- dashboard and supporting web-service work;
- Windows/Linux bootstrap and backup scripting;
- integration of third-party self-hosted applications into a common environment.

## Configuration

The committed `.env.example` contains placeholders only. Create a local `.env` and keep real credentials/tokens outside version control.

```bash
cp .env.example .env
```

Environment-specific values can include:

- timezone and UID/GID;
- host data path;
- service ports;
- optional Plex claim token;
- optional Cloudflare tunnel token.

Do not commit real claim/tunnel tokens.

## Running the stack

Review the compose file and environment configuration first:

```bash
docker compose config
docker compose up -d
```

Then inspect service health/logs rather than assuming all containers started successfully:

```bash
docker compose ps
docker compose logs --tail=100
```

This repository contains both historical and demo configuration. Check the active compose file before exposing services outside the local network.

## Security boundary

Home-lab configuration can become unsafe when old examples are copied directly into a live environment. Before using this repository today:

- replace all default/example credentials;
- restrict management interfaces to intended networks;
- check every published port;
- review tunnel/VPN configuration;
- update third-party images and dependencies;
- verify Home Assistant/MQTT authentication;
- avoid exposing services merely because an old compose revision published them;
- keep live `.env`, tokens and private configuration untracked.

## Repository notes

This is an historical infrastructure project rather than the canonical repository for every modern MAZLABZ system. Some bundled third-party directories/services are dependencies or integration material and are not represented as MAZLABZ-authored software.

The empty `MAZLABZHOMEHUB` repository is a superseded shell and should be archived at the repository-settings level.

## Development provenance

HomeHub is an authored MAZLABZ integration project developed with AI-assisted engineering workflows. Third-party services and their underlying code remain attributable to their respective projects. The portfolio claim here is the architecture, configuration, integration, deployment and troubleshooting work that joins them together.

## Portfolio significance

HomeHub is useful evidence that the later MQTT/edge-system work did not appear from nowhere. It shows an earlier stage of the same recurring capability:

**Linux · Docker · Home Assistant · MQTT · networking · service orchestration · systems integration**
