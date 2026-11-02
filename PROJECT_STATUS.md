# Project Status — MAZLABZ HomeHub

**Portfolio class:** Engineering lab / infrastructure  
**Maturity:** **Integrated homelab prototype**

This repository captures a substantive local-infrastructure build combining containerised services, Home Assistant, MQTT, reverse proxy/tunnelling/VPN concepts and media/home services.

## Evidence boundary

The repository is useful systems-integration evidence but should not be presented as a general-purpose production platform. Service availability, network security and deployment state depend on the specific homelab environment.

**Portfolio use:** Docker/Compose, local networking, Home Assistant, MQTT and multi-service integration evidence.

## Fleet reconciliation — 2 November 2026

Historical Home Assistant at `192.168.1.143:8123` was healthy on 2 October with 541 registered entities. This **does not identify** which physical Pi/host runs HA today or demonstrate that the Pi 5 HAOS/Supervisor rebuild was accepted. This repository contains older Docker/Compose infrastructure and does not necessarily reflect the current HA configuration. Also keep ATHENA Windows media at historical `192.168.1.168` distinct from Orin Nano. Next: read-only host/platform ID, backups, MQTT/entity health and live automation acceptance before modifying HA. See [fleet audit](https://github.com/thotsl4yer69/fleet/blob/main/FLEET_STATE_2026-11-02.md).
