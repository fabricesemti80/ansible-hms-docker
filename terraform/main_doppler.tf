# 3. Save the Tunnel Token in Doppler
resource "doppler_secret" "media_tunnel_token" {
  project = var.DOPPLER_PROJECT
  config  = var.DOPPLER_CONFIG
  name    = "CLOUDFLARE_TUNNEL_TOKEN_${upper(local.tunnel_name)}"
  value   = cloudflare_zero_trust_tunnel_cloudflared.media_tunnel.tunnel_token
}
