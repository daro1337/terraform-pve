terraform {
  required_providers {
    proxmox = {
      source  = "windowsD/telmate/proxmox"
      version = ">=1.0.0"
    }
  }
  required_version = ">= 0.13"
}