resource "proxmox_vm_qemu" "alk_vm" {
  count             = 1
  name              = "tf-ALKdevel-0${count.index + 1}"
  target_node       = "pve"

  clone             = "ubuntu20LTS-cloudinit"
  full_clone	      = "1"
  os_type           = "cloud-init"
  ipconfig0         = "ip=dhcp,ip6=dhcp"
  onboot	           = "1"
  cores             = 2
  sockets           = "2"
  cpu               = "host"
  numa		           = "1"
  memory            = 4096
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
  hotplug           = "network,cpu,memory,disk"
  agent		          = 1

  disk {
    #fix applied https://github.com/Telmate/terraform-provider-proxmox/issues/233
    #id              = 0
    size            = "16G"
    type            = "scsi"
    storage         = "vmstorage"
    storage_type    = "dir"
    format	        = "qcow2"
    iothread        = true
    cache	          = "writeback"
  }

  network {
    #id              = 0
    model           = "virtio"
    bridge          = "vmbr0"
  }
}
