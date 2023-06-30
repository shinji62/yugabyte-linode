#cloud-config
package_update: true
package_upgrade: true
ssh_authorized_keys:
- ${public_key_node}


users:
  - default
  - name: ybadmin
    groups: sudo
    shell: /bin/bash
    sudo: ['ALL=(ALL) NOPASSWD:ALL']
    ssh-authorized-keys:
    - ${public_key_node}


packages:
  - curl
  - wget
  - jq

bootcmd:
- while [ ! -b $(readlink -f /dev/disk/by-id/scsi-0Linode_Volume_dataDisk${num}) ]; do echo "waiting for device /dev/disk/by-id/scsi-0Linode_Volume_dataDisk${num}"; sleep 5 ; done
- blkid $(readlink -f /dev/disk/by-id/scsi-0Linode_Volume_dataDisk${num}) || mkfs -t xfs $(readlink -f /dev/disk/by-id/scsi-0Linode_Volume_dataDisk${num})
- mkdir -p /mnt/data

mounts:
- [ "/dev/disk/by-id/scsi-0Linode_Volume_dataDisk${num}", "/mnt/data", "xfs", "defaults,nofail,noatime" ]

runcmd:
  - |
    env

