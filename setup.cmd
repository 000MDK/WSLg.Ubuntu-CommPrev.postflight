copy .\systemd-sysusers.service \\wsl.localhost\Ubuntu-CommPrev\tmp\systemd-sysusers.service
copy .\bash.bashrc \\wsl.localhost\Ubuntu-CommPrev\tmp\bash.bashrc
copy .\fonts.conf \\wsl.localhost\Ubuntu-CommPrev\tmp\fonts.conf
copy .\sudoers \\wsl.localhost\Ubuntu-CommPrev\tmp\sudoers
copy .\setup.sh \\wsl.localhost\Ubuntu-CommPrev\tmp\setup.sh
ubuntupreview.exe run "sudo -s chmod +x /tmp/setup.sh"
ubuntupreview.exe run "sudo -s /tmp/setup.sh"
ubuntupreview.exe run "genie -i"
cmd.exe /C setx WSLENV BASH_ENV/u
cmd.exe /C setx BASH_ENV /etc/bash.bashrc
