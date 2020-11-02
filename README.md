# Installation
* golang
* terraform
* terraform proxmox provider

``` go version go1.15.3 linux/amd6 ```

```https://github.com/Telmate/terraform-provider-proxmox/blob/master/docs/installation.md```


```terraform ```

## Cloud-init @pve:
### edit image and rebuiuld template
```
apt install libguestfs-tools
```

Edit:
```
virt-edit -a cloudImage /path/to/cloud.cfg
```
Cat:
```
virt-cat -a cloudImage /path/to/cloud.cfg
```

import image to local storage
```
qm importdisk 9000 focal-server-cloudimg-amd64.img vmstorage --format qcow2
```
Attach image to template
```
 qm set 9000 --scsihw virtio-scsi-pci --scsi0 vmstorage:9000/vm-9000-disk-1.qcow2
 ```

Resize disk size
 ```
 qm resize 9000 scsi0 +8G
 ```


```
root@windowsD:/opt/terraform# terraform state list
proxmox_vm_qemu.alk_vm[0]
proxmox_vm_qemu.k8s-kubelet[0]
proxmox_vm_qemu.k8s-kubelet[1]
proxmox_vm_qemu.k8s-kubelet[2]
proxmox_vm_qemu.k8s_master[0]
proxmox_vm_qemu.k8s_master[1]
proxmox_vm_qemu.k8s_master[2]
```