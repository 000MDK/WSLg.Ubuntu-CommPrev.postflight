#/bin/sh

apt update

apt upgrade -y

apt dist-upgrade

locale-gen en_US.UTF-8

update-locale LANG=en_US.UTF-8

wget -O /etc/apt/trusted.gpg.d/wsl-transdebian.gpg https://arkane-systems.github.io/wsl-transdebian/apt/wsl-transdebian.gpg

chmod a+r /etc/apt/trusted.gpg.d/wsl-transdebian.gpg

cat << EOF > /etc/apt/sources.list.d/wsl-transdebian.list
deb https://arkane-systems.github.io/wsl-transdebian/apt/ jammy main
deb-src https://arkane-systems.github.io/wsl-transdebian/apt/ jammy main
EOF

apt update

apt install update-manager-core pulseaudio-dummy xwayland-dummy

apt install -y systemd-genie

systemctl disable apparmor.service

systemctl disable auditd.service

touch /etc/cloud/cloud-init.disabled

systemctl disable multipathd.service

ssh-keygen -A

systemctl disable systemd-modules-load.service

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

systemctl set-default multi-user.target

apt autoremove

cp /tmp/bash.bashrc /etc/bash.bashrc
chmod 440 /etc/bash.bashrc
cp /tmp/sudoers /etc/sudoers
chmod 440 /etc/sudoers
rm /etc/fstab
touch /etc/fstab
chmod 644 /etc/fstab
cp /tmp/fonts.conf /etc/fonts/fonts.conf
chmod 644 /etc/fonts/fonts.conf
cp /tmp/systemd-sysusers.service /usr/lib/systemd/system/systemd-sysusers.service
chmod 644 /usr/lib/systemd/system/systemd-sysusers.service
