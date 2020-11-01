terraform {
  required_providers {
    proxmox = {
      source  = "windowsd/telmate/proxmox"
      version = ">=1.0.0"
    }
  }
  required_version = ">= 0.13"
}
