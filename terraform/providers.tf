terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.89.1"
    }
  }
}

variable "PROXMOX_AUTH_TOKEN" {
  sensitive   = true
  description = "terraform@pve!provider=xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"
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
