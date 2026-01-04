# Terraform Setup Guide

This guide details the secrets and steps required to manage the infrastructure in this repository using Terraform and Doppler.

## 1. Secrets Management (Doppler)

We use **Doppler** to securely manage secrets. You need to create a project named `ansible-hms-docker` in Doppler and add the following secrets to the `dev` config:

| Secret Name | Description | Example / Format |
|---|---|---|
| `PROXMOX_AUTH_TOKEN` | API Token for Proxmox (User: `terraform@pve`, Realm: `pve`) | `terraform@pve!provider=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx` |
| `CLOUDFLARE_API_TOKEN` | Cloudflare API Token with permissions for DNS, Tunnels, and Access | |
| `CLOUDFLARE_ACCOUNT_ID` | Cloudflare Account ID | |
| `ACCESS_EMAILS` | List of email addresses allowed to access the applications | |
| `DOPPLER_TOKEN` | Doppler Service Token (automatically injected by `doppler run`) | |
| `DOMAIN` | The root domain for the media stack (e.g., `example.com`) | |

### Generated Outputs

Terraform will automatically generate and save the following secrets back to Doppler:

- `CLOUDFLARE_TUNNEL_TOKEN_<DOMAIN_UNDERSCORE>`: The token for the created Cloudflare Tunnel.

## 2. Local Setup

### Install Tools
Ensure you have the following installed:
- [Terraform](https://developer.hashicorp.com/terraform/downloads)
- [Doppler CLI](https://docs.doppler.com/docs/install-cli)
- [Task](https://taskfile.dev/installation/)

### Doppler Authentication
```bash
doppler login
doppler setup --project ansible-hms-docker --config dev
```

## 3. Usage

All Terraform commands should be run via `task` to ensure secrets are correctly injected:

```bash
# Initialize Terraform
task tf:init

# Plan changes
task tf:plan

# Apply changes
task tf:apply

# Destroy infrastructure
task tf:destroy
```

## 4. SSH Configuration

The Proxmox provider connects via SSH to the node. Ensure your SSH private key is available at:
`~/.ssh/fs_home_rsa`

If your key is in a different location, you can update the `proxmox_ssh_private_key_file` default value in `terraform/providers.tf` or set it via a variable.

## 5. VM Configuration Details

The current setup deploys **dkr-media-0** with the following specs:
- **VM ID**: 4030
- **Hostname**: dkr-media-0
- **IP Address**: 10.0.40.30/24
- **Gateway**: 10.0.40.1
- **Node**: pve-2
- **Resources**: 4 Cores, 8GB RAM, 32GB Disk
