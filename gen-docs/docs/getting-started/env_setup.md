# Environment Variable Setup

This document lists the environment variables that can be used to configure the `hms-docker` stack. You can set these in a `.envrc` file if you use `direnv`, or export them in your shell before running the Ansible playbook.

## General Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `PROJECT_NAME` | The name of the Docker Compose project. | `hms-docker` |
| `HMS_DOCKER_DATA_PATH` | Base path for project data. | `/opt/${PROJECT_NAME}` |
| `HMS_DOCKER_APPS_PATH` | Path where application configuration is stored. | `${HMS_DOCKER_DATA_PATH}/apps` |
| `SECRETS_ENV_USER` | Owner of the `.env` file. | `root` |
| `SECRETS_ENV_GROUP` | Group of the `.env` file. | `root` |
| `SECRETS_ENV_MODE` | Permissions mode for the `.env` file. | `0600` |
| `HMS_DOCKER_SUBNET_MASK` | Subnet mask for the proxy network. | `24` |
| `HMS_DOCKER_NETWORK_SUBNET` | Subnet range for the project. | |
| `HMS_DOCKER_DOMAIN` | The root domain for all services. | `home.local` |
| `HMS_DOCKER_MEDIA_SHARE_TYPE` | Type of media share (`local`, `cifs`, `nfs`). | `local` |
| `HMS_DOCKER_MOUNT_PATH` | Base path for mounting media volumes. | `/opt/${PROJECT_NAME}` |
| `HMS_DOCKER_PRIMARY_MOUNT_NAME` | Name of the primary media mount. | `media_data` |
| `HMS_DOCKER_LIBRARY_FOLDER_NAME` | Name of the library folder. | `_library` |
| `HMS_DOCKER_DOWNLOADS_FOLDER_NAME` | Name of the downloads folder. | `_downloads` |
| `CONTAINER_TIMEZONE` | Timezone for containers. | `America/New_York` |
| `CONTAINER_UID` | User ID for container processes. | `1234` |
| `CONTAINER_GID` | Group ID for container processes. | `1234` |
| `CONTAINER_EXPOSE_PORTS` | Whether to expose ports to the host. | `yes` |

## Traefik Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `TRAEFIK_SSL_ENABLED` | Enable SSL for Traefik. | `no` |
| `TRAEFIK_SECURITY_HARDENING` | Enable security hardening headers. | `no` |
| `TRAEFIK_SSL_USE_LETSENCRYPT_STAGING_URL` | Use Let's Encrypt staging environment. | `yes` |
| `TRAEFIK_SSL_SANS` | Subject Alternative Names for SSL. | `*.${HMS_DOCKER_DOMAIN}` |
| `TRAEFIK_SSL_DNS_PROVIDER_CODE` | DNS provider code for ACME challenge. | |
| `TRAEFIK_SSL_LETSENCRYPT_EMAIL` | Email for Let's Encrypt. | |
| `TRAEFIK_SUBNET_ALLOW_LIST` | IPs/Subnets allowed to bypass external restrictions. | |

## Cloudflare Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `CLOUDFLARE_DDNS_ENABLED` | Enable Cloudflare DDNS. | `no` |
| `CLOUDFLARE_API_TOKEN` | Cloudflare API Token. | |
| `CLOUDFLARE_TUNNEL_ENABLED` | Enable Cloudflare Tunnel. | `no` |
| `CLOUDFLARE_TUNNEL_TOKEN` | Cloudflare Tunnel Token. | |

## Plex Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `PLEX_CLAIM_TOKEN` | Plex Claim Token. | |
| `PLEX_ADVERTISE_IP` | IP to advertise for Plex. | |
| `HMS_DOCKER_PLEX_SSL_ENABLED` | Enable custom SSL for Plex. | `no` |

## Tailscale Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `TAILSCALE_ENABLED` | Enable Tailscale container. | `no` |
| `TAILSCALE_AUTH_KEY` | Tailscale Auth Key. | |

## Authentik Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `AUTHENTIK_ENABLED` | Enable Authentik integration. | `no` |
| `AUTHENTIK_PG_USER` | Authentik Database User. | `authentik` |
| `AUTHENTIK_PG_DB` | Authentik Database Name. | `authentik` |

## Homepage API Keys

| Variable | Description | Default |
|----------|-------------|---------|
| `HOMEPAGE_NZBGET_USERNAME` | Username for NZBGet widget. | |
| `HOMEPAGE_NZBGET_PASSWORD` | Password for NZBGet widget. | |
| `HOMEPAGE_AUTHENTIK_KEY` | API Key for Authentik widget. | |
| `HOMEPAGE_PORTAINER_KEY` | API Key for Portainer widget. | |
| `HOMEPAGE_JELLYFIN_KEY` | API Key for Jellyfin widget. | |
| `HOMEPAGE_IMMICH_KEY` | API Key for Immich widget. | |

## Service Misc Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `HMSDOCKER_SPEEDTEST_API_KEY` | Speedtest Tracker API Key. | |
| `HMSDOCKER_NOTIFIARR_API_KEY` | Notifiarr API Key. | |
| `FILEBROWSER_ADMIN_PASSWORD` | Admin password for Filebrowser. | `admin` |
| `FILERISE_PERSISTENT_TOKENS_KEY` | Persistent tokens key for Filerise. | `changeme` |
| `BESZEL_AGENT_KEY` | Beszel Agent Key. | |

## Proxmox & Terraform Settings

| Variable | Description | Default |
|----------|-------------|---------|
| `PROXMOX_AUTH_TOKEN` | Proxmox API Token. | |
| `PROXMOX_SSH_PRIVATE_KEY_FILE` | Path to SSH private key. | `~/.ssh/fs_home_rsa` |
