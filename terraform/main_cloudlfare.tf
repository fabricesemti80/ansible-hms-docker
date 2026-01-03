# Retrieve secrets from Doppler
# Using standard variables populated by TF_VAR_ environment variables

locals {
  # Parse the JSON list of emails from Doppler
  access_emails = jsondecode(var.ACCESS_EMAILS)
  media_domain  = var.DOMAIN

  # Replace dots with underscores for the tunnel name
  tunnel_name = replace(local.media_domain, ".", "_")
}
# 1. Create a Cloudflare Tunnel

resource "cloudflare_zero_trust_tunnel_cloudflared" "media_tunnel" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = local.tunnel_name
  secret     = base64sha256(random_password.tunnel_secret.result)
}

# Generate a random secret for the tunnel
resource "random_password" "tunnel_secret" {
  length  = 32
  special = true
}

# 2. Create a Wildcard DNS Record pointing to the Tunnel
data "cloudflare_zone" "media_zone" {
  name = local.media_domain
}

resource "cloudflare_record" "wildcard" {
  zone_id = data.cloudflare_zone.media_zone.id
  name    = "*"
  content = "${cloudflare_zero_trust_tunnel_cloudflared.media_tunnel.id}.cfargotunnel.com"
  type    = "CNAME"
  proxied = true
}

# 3. Configure Tunnel Ingress Rules (Route to Traefik)
resource "cloudflare_zero_trust_tunnel_cloudflared_config" "media_tunnel_config" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  tunnel_id  = cloudflare_zero_trust_tunnel_cloudflared.media_tunnel.id

  config {
    ingress_rule {
      hostname = "*.${local.media_domain}"
      service  = "http://traefik:80"
    }

    # Required catch-all rule
    ingress_rule {
      service = "http_status:404"
    }
  }
}

# 4. Cloudflare Access Applications & Policies

# --- Wildcard Application (Default: Protected) ---
# Protects all subdomains by default (*.domain.com) requiring email authentication.
resource "cloudflare_zero_trust_access_application" "media_app" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "Media Stack Access"
  domain     = "*.${local.media_domain}"
  type       = "self_hosted"
}

resource "cloudflare_zero_trust_access_policy" "media_policy" {
  application_id = cloudflare_zero_trust_access_application.media_app.id
  precedence     = 1
  zone_id        = data.cloudflare_zone.media_zone.id
  name           = "Allow Team"
  decision       = "allow"

  include {
    email = local.access_emails
  }
}

# --- Jellyfin Application (Bypass) ---
# Specific application for Jellyfin to bypass authentication (needed for TV/Mobile clients).
resource "cloudflare_zero_trust_access_application" "jellyfin_app" {
  account_id = var.CLOUDFLARE_ACCOUNT_ID
  name       = "Jellyfin (Bypass)"
  domain     = "jellyfin.${local.media_domain}"
  type       = "self_hosted"
}

resource "cloudflare_zero_trust_access_policy" "jellyfin_bypass" {
  application_id = cloudflare_zero_trust_access_application.jellyfin_app.id
  precedence     = 1
  zone_id        = data.cloudflare_zone.media_zone.id
  name           = "Bypass Auth"
  decision       = "bypass"

  include {
    everyone = true
  }
}