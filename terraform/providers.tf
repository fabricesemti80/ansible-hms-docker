terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.89.1"
    }
    cloudflare = {
      source  = "cloudflare/cloudflare"
      version = "~> 4.0"
    }
    doppler = {
      source  = "DopplerHQ/doppler"
      version = "~> 1.0"
    }
  }
}

variable "PROXMOX_AUTH_TOKEN" {
  sensitive   = true
  description = "terraform@pve!provider=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
}

variable "DOPPLER_TOKEN" {
  sensitive   = true
  description = "Doppler Service Token"
}

variable "CLOUDFLARE_API_TOKEN" {
  sensitive   = true
  description = "Cloudflare API Token"
}

variable "CLOUDFLARE_ACCOUNT_ID" {
  sensitive   = true
  description = "Cloudflare Account ID"
}

variable "DOPPLER_PROJECT" {
  description = "Doppler Project Name"
}

variable "DOPPLER_CONFIG" {
  description = "Doppler Config Name"
}

variable "ACCESS_EMAILS" {
  description = "JSON list of emails for Cloudflare Access"
  type        = string
}

variable "DOMAIN" {
  description = "Root domain for the media stack"
  type        = string
}

variable "proxmox_ssh_private_key_file" {
  description = "Path to the SSH private key for Proxmox"
  default     = "~/.ssh/fs_home_rsa"
}

provider "proxmox" {
  endpoint  = "https://10.0.40.10:8006/"
  api_token = var.PROXMOX_AUTH_TOKEN
  insecure  = true
  ssh {
    username    = "root"
    agent       = false
    private_key = file(pathexpand(var.proxmox_ssh_private_key_file))
    node {
      name    = "pve-2"
      address = "10.0.40.10"
    }
  }
}

provider "doppler" {
  doppler_token = var.DOPPLER_TOKEN
}

provider "cloudflare" {
  api_token = var.CLOUDFLARE_API_TOKEN
}
