<div align="center">

<img src="./gen-docs/docs/static/img/hmsd.png" alt="hmsdocker-logo"/>

[![Discord](https://dcbadge.limes.pink/api/server/MqXTXvWSkZ?style=flat-square)](https://discord.gg/MqXTXvWSkZ)
![GitHub Release](https://img.shields.io/github/v/release/ahembree/ansible-hms-docker?style=flat-square&color=blue)
![GitHub Repo stars](https://img.shields.io/github/stars/ahembree/ansible-hms-docker?style=flat-square&color=blue)
<br>
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/ahembree/ansible-hms-docker/run-playbook.yml?style=flat-square&label=Ubuntu%2022.04%20Deployment)
![GitHub Actions Workflow Status](https://img.shields.io/github/actions/workflow/status/ahembree/ansible-hms-docker/run-playbook.yml?style=flat-square&label=Ubuntu%2024.04%20Deployment)
![Last Commit](https://img.shields.io/github/last-commit/ahembree/ansible-hms-docker?style=flat-square)
![GitHub License](https://img.shields.io/github/license/ahembree/ansible-hms-docker?style=flat-square&color=blue)

</div>

# HMS-Docker

Ansible Playbook to setup an automated Home Media Server stack running on Docker across a variety of platforms with support for GPUs, SSL, SSO, DDNS, and more.

## Features

- GPU acceleration for media transcoding
  - Intel and Nvidia GPU support
  - You must install the drivers for your Nvidia GPU yourself, it is not included in this playbook, but it will verify GPU acceleration is available
- Automatic Docker installation
- Automatic container updates
- Automatic App Initialization (Sonarr, Radarr, Prowlarr, etc.)
- Dynamic DNS updates with Cloudflare
- Wildcard SSL certificate generation
- Support for multiple network shares
- Single Sign-On with Authentik
- Support for separate 4K instances of Sonarr and Radarr
- Automated dashboard configuration in [Homepage](https://gethomepage.dev/)
- Custom scripts
  - Advanced monitoring script(s) for Uptime-Kuma to detect if media is actually accessible by the Plex container
  - Convert Traefik certificate file to a Plex-supported certificate file (PKCS12)

## Getting Started

Please see the docs page at: https://docs.hmsdocker.dev

## Contributing

Pull requests are always welcome!

If you have suggestions for containers to add or any other improvements, please submit a [Discussion Post](https://github.com/ahembree/ansible-hms-docker/discussions)

## Documentation

- [Introduction](./gen-docs/docs/intro.md)
- [Design Decisions](./gen-docs/docs/design-decisions.md)
- [Paths](./gen-docs/docs/paths.md)
- [Container List](./gen-docs/docs/container-list.md)
- [Container Map](./gen-docs/docs/container-map.md)

### Getting Started

- [Requirements](./gen-docs/docs/getting-started/requirements.md)
- [Installation](./gen-docs/docs/getting-started/install.md)
- [Environment Variable Setup](./gen-docs/docs/getting-started/env_setup.md)
- [DNS Setup](./gen-docs/docs/getting-started/dns-setup.md)
- [App Bootstrap](./gen-docs/docs/getting-started/app-bootstrap.md)
- [Container Overrides](./gen-docs/docs/getting-started/container-overrides.md)
- [Updating](./gen-docs/docs/getting-started/updating.md)
- [GPU](./gen-docs/docs/getting-started/GPU.md)
- [Network Shares](./gen-docs/docs/getting-started/network-shares/NAS.md)
  - [Additional NAS](./gen-docs/docs/getting-started/network-shares/additional-nas.md)
- [VPN and Download Clients](./gen-docs/docs/getting-started/vpn-and-dl-clients/deluge.md)
  - [qBittorrent](./gen-docs/docs/getting-started/vpn-and-dl-clients/qbittorrent.md)
  - [Transmission](./gen-docs/docs/getting-started/vpn-and-dl-clients/transmission.md)

### Configuration

- [Authentik](./gen-docs/docs/config-docs/Authentik.md)
- [Homepage](./gen-docs/docs/config-docs/Homepage.md)
- [Netdata](./gen-docs/docs/config-docs/Netdata.md)
- [Networking](./gen-docs/docs/config-docs/Networking.md)
- [Tailscale](./gen-docs/docs/config-docs/Tailscale.md)
- **Cloudflare**
  - [DDNS](./gen-docs/docs/config-docs/Cloudflare/ddns.md)
  - [Tunnel](./gen-docs/docs/config-docs/Cloudflare/tunnel.md)
- **Traefik**
  - [Other Services](./gen-docs/docs/config-docs/traefik/other-svcs.md)
  - [Security](./gen-docs/docs/config-docs/traefik/security.md)
  - [SSL](./gen-docs/docs/config-docs/traefik/ssl.md)

### Examples

- [Container Connections](./gen-docs/docs/Examples/container-connections.md)

### Release Notes

- [v0.1](./gen-docs/docs/release-notes/v0.1.md)
- [v0.2](./gen-docs/docs/release-notes/v0.2.md)
- [v0.3](./gen-docs/docs/release-notes/v0.3.md)
- [v1.4](./gen-docs/docs/release-notes/v1.4.md)
- [v1.5](./gen-docs/docs/release-notes/v1.5.md)
- [v1.6](./gen-docs/docs/release-notes/v1.6.md)
- [v1.7](./gen-docs/docs/release-notes/v1.7.md)
- [v1.8](./gen-docs/docs/release-notes/v1.8.md)
- [v1.9](./gen-docs/docs/release-notes/v1.9.md)

### Post-Installation Setup

For guidance on connecting the various applications together, please see the following documents:

- **[Usenet Client Configuration](./gen-docs/docs/getting-started/usenet-clients.md)**: A guide to setting up SabNZBD, NZBGet, and Prowlarr.
- **[Automatic App Initialization](./gen-docs/docs/getting-started/app-bootstrap.md)**: Details the automated setup process for services like Sonarr, Radarr, and Prowlarr.
- **[Container Connections Guide](./gen-docs/docs/Examples/container-connections.md)**: Provides examples and instructions for manually connecting containers.

### Other Documentation

- [Immich Setup](./doc/immich_setup.md)
- [Terraform Documentation](./terraform/README.md)

### Legacy Documentation

- [Legacy Post-Install Steps](./doc/post_install.md)
