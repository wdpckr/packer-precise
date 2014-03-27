# packer template for vagrant boxes

This repository contains a Packer template for building custom machine images
on top of Ubuntu 12.04. 

Currently this is setup for VirtualBox and VMware.

## Prerequisites
[install VirtualBox](https://www.virtualbox.org)  
[install VMWare Fusion/Workstation](https://www.vmware.com)  
[install Packer](http://www.packer.io/intro/getting-started/setup.html)


## Usage
Clone this repository and `cd` into it.

Run the following:

```
$ packer build template.json
```

At the end of that, you'll have two boxes ready for Vagrant:

```
precise32.virtualbox.box
precise32.vmware.box
```
