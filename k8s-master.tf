resource "proxmox_vm_qemu" "k8s_master" {

  count             = 3
  name              = "tf-k8s-master-0${count.index}"
  target_node       = "pve"

  clone             = "ubuntu20LTS-template"
  full_clone	      = "1"
  force_create	    = false
  os_type           = "ubuntu"
  onboot	          = "1"
  cores             = 1
  sockets           = "1"
  cpu               = "host"
  numa		          = "1"
  memory            = 1024
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
  hotplug           = "network,cpu,memory,disk"
  agent		          = 1
  disk {
    id              = 0
    size            = 16
    type            = "scsi"
    storage         = "vmstorage"
    storage_type    = "dir"
    format	        = "qcow2"
    iothread        = true
    cache	          = "writeback"
  }

  network {
    id              = 0
    model           = "virtio"
    bridge          = "vmbr0"
  }
}
