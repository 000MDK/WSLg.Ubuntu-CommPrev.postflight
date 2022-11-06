#/bin/sh

apt update

apt upgrade -y

apt dist-upgrade -y

sudo do-release-upgrade

locale-gen en_US.UTF-8

update-locale LANG=en_US.UTF-8

apt install -y update-manager-core

ssh-keygen -A

cat << EOF > /etc/systemd/network/10-eth0.network
[Match]
Name=eth0

[Link]
Unmanaged=yes

[Network]
DHCP=no

[DHCP]
UseDNS=false
EOF

apt autoremove -y

#rm -f /etc/bash.bashrc
#cp /tmp/bash.bashrc /etc/bash.bashrc
#chmod 555 /etc/bash.bashrc
#rm -f /etc/sudoers
#cp /tmp/sudoers /etc/sudoers
#chmod 440 /etc/sudoers
#rm -f /etc/fstab
#touch /etc/fstab
#chmod 644 /etc/fstab
#rm -f /etc/fonts/fonts.conf
#cp /tmp/fonts.conf /etc/fonts/fonts.conf
#chmod 644 /etc/fonts/fonts.conf
