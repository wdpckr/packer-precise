#!/bin/bash

# Install the VMware Fusion guest tools
# precondition: packages 'build-essential' and 'linux-headers-$(uname -r)' have to be installed 
cd /tmp
mkdir -p /mnt/cdrom
mount -o loop ~/linux.iso /mnt/cdrom
tar zxf /mnt/cdrom/VMwareTools-*.tar.gz -C /tmp/
/tmp/vmware-tools-distrib/vmware-install.pl -d
rm /home/vagrant/linux.iso
umount /mnt/cdrom
