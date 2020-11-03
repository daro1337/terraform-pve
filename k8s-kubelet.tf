resource "proxmox_vm_qemu" "k8s-kubelet" {
  count             = 3
  name              = "tf-kubelet-0${count.index + 1}"
  target_node       = "pve"

  clone             = "ubuntu20LTS-cloudinit"
  full_clone	      = "1"
  force_create	    = false
  os_type           = "cloud-init"
  #network range 192.168.168.204 - 192.168.168.20n
  ipconfig0         = "ip=192.168.168.20${count.index + 3}/24,gw=192.168.168.1"
  sshkeys           = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDBeXGn0+2z/69MYQrVp1jZLlY5IipUQzyPDZ0Ww1ZmUREDkv0uBhMG4JD131KziMIaMrtIG/s0QroC80WllwYrfqDUxLCxlpLvqBdxrxbaVBhZUcPfB1AWG3A1NwFbs9fA+bMHQA9LBDMQM+bLJSshClkG+YvWtZVtXk0XhMt01J6sTol3JP3XhIbkWQ6NguIggKoSqksD72jFvbRwQbMQm9gZo4jF713NS8DgRvn4wTXtfgmT2NGPIjois+N/Ti/P+lOo4J59PhNEZqVIN0yLqkJ7mhdIxUf+Mcy61+qotpbvF/qls79nHmvTSg6Yr7s+zwjZBII8KVsi+m3D1nPV daro@windowsD"
  ciuser            = "root"
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
    tag             = 0
  }
}
