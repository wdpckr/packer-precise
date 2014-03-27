#!/bin/bash

# no password required for sudo members
echo "%sudo ALL=NOPASSWD:ALL" > /etc/sudoers.d/vagrant
# take some environment variables over to sudo
echo 'Defaults env_keep="http_proxy https_proxy ftp_proxy"' >> /etc/sudoers.d/vagrant

chmod 0440 /etc/sudoers.d/vagrant

# add vagrant to group sudo
usermod -a -G sudo vagrant

# Installing vagrant keys
mkdir /home/vagrant/.ssh
chmod 700 /home/vagrant/.ssh
cd /home/vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 /home/vagrant/.ssh/authorized_keys
chown -R vagrant:vagrant /home/vagrant/.ssh

# get dotfiles
git clone https://github.com/wdpckr/dotfiles.git /home/vagrant/dotfiles
cp -r /home/vagrant/dotfiles/.zsh* /home/vagrant
chown -R vagrant:vagrant /home/vagrant/.zsh*
chmod -R 664 /home/vagrant/.zsh*
chmod 775 /home/vagrant/.zsh /home/vagrant/.zsh/plugin
rm -rf /home/vagrant/dotfiles /home/vagrant/.zsh/plugin

# link dotfiles for root
ln -s /home/vagrant/.zshrc /root/.zshrc
ln -s /home/vagrant/.zsh /root/.zsh

# create /home/vagrant/bin and /home/vagrant/.buildenv 
mkdir /home/vagrant/bin /home/vagrant/.buildenv
chown -R vagrant:vagrant /home/vagrant/bin /home/vagrant/.buildenv
chmod 775 /home/vagrant/bin /home/vagrant/.buildenv 

# change shell
chsh -s /usr/bin/zsh vagrant
