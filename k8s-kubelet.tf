resource "proxmox_vm_qemu" "k8s-kubelet" {
  count             = 3
  name              = "tf-kubelet-0${count.index + 1}"
  target_node       = "pve"

  clone             = "ubuntu20LTS-template"
  full_clone	      = "1"
  #force_create	    = false
  os_type           = "ubuntu"
  onboot	          = "1"
  cores             = 1
  sockets           = "2"
  cpu               = "host"
  numa		          = "1"
  memory            = 2048
  scsihw            = "virtio-scsi-pci"
  bootdisk          = "scsi0"
  hotplug           = "network,cpu,memory,disk"
  agent		          = 1
  disk {
    #id              = 0
    size            = "20G"
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
