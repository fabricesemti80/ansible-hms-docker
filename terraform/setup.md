# Terraform Setup & Environment Variables

This Terraform configuration manages the Proxmox Infrastructure and Cloudflare Networking/Access.

## Required Environment Variables

These variables should be managed via **Doppler**.

### Providers Authentication & Configuration

| Variable | Description | Source |
| :--- | :--- | :--- |
| `TF_VAR_PROXMOX_AUTH_TOKEN` | API Token for Proxmox (User: `terraform@pve`, Realm: `pve`) | Doppler |
| `TF_VAR_CLOUDFLARE_API_TOKEN` | Cloudflare API Token with permissions for DNS, Tunnels, and Access | Doppler |
| `TF_VAR_CLOUDFLARE_ACCOUNT_ID` | Cloudflare Account ID | Doppler |
| `TF_VAR_ACCESS_EMAILS` | List of email addresses allowed to access the applications | Doppler |
| `TF_VAR_DOPPLER_TOKEN` | Doppler Service Token (automatically injected by `doppler run`) | Doppler |

### Application Configuration

| Variable | Description | Format | Source |
| :--- | :--- | :--- | :--- |
| `DOMAIN` | The root domain for the media stack (e.g., `example.com`) | String | Doppler |
| `DOPPLER_PROJECT` | Name of the Doppler Project | String | Doppler (Auto) |
| `DOPPLER_CONFIG` | Name of the Doppler Config (e.g., `dev`) | String | Doppler (Auto) |

## Generated Outputs

Terraform will automatically generate and save the following secrets back to Doppler:

*   `CLOUDFLARE_TUNNEL_TOKEN_<DOMAIN_UNDERSCORE>`: The token for the created Cloudflare Tunnel.

## Deployment

Run the deployment using the defined Taskfile commands:

```bash
# Plan
task tf:plan

# Apply
task tf:apply

# Destroy
task tf:destroy
```