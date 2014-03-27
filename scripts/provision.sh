#!/bin/bash

# disable DNS request at ssh connections
echo "UseDNS no" >> /etc/ssh/sshd_config
# restart server
reload ssh

# language settings
echo 'LANGUAGE="en_US.UTF-8"' > /etc/default/locale
echo 'LANG="en_US.UTF-8"' >> /etc/default/locale
echo 'LC_ALL="en_US.UTF-8"' >> /etc/default/locale

# preparation for 'vagrant provision log'
rm -f /etc/update-motd.d/10-help-text
touch /etc/update-motd.d/19-empty-line
touch /etc/update-motd.d/20-vagrant-provision
chmod 755 /etc/update-motd.d/20-vagrant-provision
chmod 755 /etc/update-motd.d/19-empty-line
echo '#!/bin/sh' >> /etc/update-motd.d/19-empty-line
echo 'printf "\n"' >> /etc/update-motd.d/19-empty-line
echo '#!/bin/sh' >> /etc/update-motd.d/20-vagrant-provision
cp /etc/update-motd.d/19-empty-line /etc/update-motd.d/21-empty-line

# alter interface config
echo "Adding a 2 sec delay to the interface up, to make the dhclient happy"
echo "pre-up sleep 2" >> /etc/network/interfaces

# install current software packages
add-apt-repository -y ppa:gnome-terminator
add-apt-repository -y ppa:fcwu-tw/ppa
add-apt-repository -y ppa:git-core/ppa
apt-get update -y
apt-get upgrade -y
apt-get install -y terminator
apt-get install -y vim
apt-get install -y vim-gnome
apt-get install -y git 
apt-get install -y gitk git-flow

## install git-extras
#cd /tmp && git clone --depth 1 https://github.com/visionmedia/git-extras.git && cd git-extras && make install
#rm -rf /tmp/git-extras