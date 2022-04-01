# System-wide .bashrc file for interactive bash(1) shells.

# To enable the settings / commands in this file for login shells as well,
# this file has to be sourced in /etc/profile.

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, overwrite the one in /etc/profile)
# but only if not SUDOing and have SUDO_PS1 set; then assume smart user.
if ! [ -n "${SUDO_USER}" -a -n "${SUDO_PS1}" ]; then
  PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

# Commented out, don't overwrite xterm -T "title" -n "icontitle" by default.
# If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD}\007"'
#    ;;
#*)
#    ;;
#esac

# enable bash completion in interactive shells
#if ! shopt -oq posix; then
#  if [ -f /usr/share/bash-completion/bash_completion ]; then
#    . /usr/share/bash-completion/bash_completion
#  elif [ -f /etc/bash_completion ]; then
#    . /etc/bash_completion
#  fi
#fi

# sudo hint
if [ ! -e "$HOME/.sudo_as_admin_successful" ] && [ ! -e "$HOME/.hushlogin" ] ; then
    case " $(groups) " in *\ admin\ *|*\ sudo\ *)
    if [ -x /usr/bin/sudo ]; then
	cat <<-EOF
	To run a command as administrator (user "root"), use "sudo <command>".
	See "man sudo_root" for details.
	
	EOF
    fi
    esac
fi

# if the command-not-found package is installed, use it
if [ -x /usr/lib/command-not-found -o -x /usr/share/command-not-found/command-not-found ]; then
	function command_not_found_handle {
	        # check because c-n-f could've been removed in the meantime
                if [ -x /usr/lib/command-not-found ]; then
		   /usr/lib/command-not-found -- "$1"
                   return $?
                elif [ -x /usr/share/command-not-found/command-not-found ]; then
		   /usr/share/command-not-found/command-not-found -- "$1"
                   return $?
		else
		   printf "%s: command not found\n" "$1" >&2
		   return 127
		fi
	}
fi

wsl_mount_root=/mnt
wsl_windir="${wsl_mount_root}/c/WINDOWS/System32"
wsl_distro=Ubuntu-CommPrev
wsl_wslg_display=0
# check if in-built wslg socket exists at all
if test -S $wsl_mount_root/wslg/.X11-unix/X0; then
        # fix is needed in case system socket in /tmp doesn't exist or it's true, canonical path isn't the wslg socket's one
        if ! test -e /tmp/.X11-unix/X${wsl_wslg_display} || ! test "$(readlink -f /tmp/.X11-unix/X${wsl_wslg_display})" = "$wsl_mount_root/wslg/.X11-unix/X0"; then
			echo -e "* WSL: restoring WSLG X11 server socket on /tmp/.X11-unix/X${wsl_wslg_display}"
			# recreate /tmp/.X11-unix directory if needed
			if test ! -d /tmp/.X11-unix; then
				$wsl_windir/wsl.exe -d $wsl_distro -u root install -dm 1777 -o root /tmp/.X11-unix
			fi
			# delete existing socket if needed. this must obviously break something that created that socket
			# and you'd rather define display not colliding with other sockets
			if test -e /tmp/.X11-unix/X${wsl_wslg_display}; then
				$wsl_windir/wsl.exe -d $wsl_distro -u root rm -Rf /tmp/.X11-unix/X${wsl_wslg_display} /tmp/.X${wsl_wslg_display}-lock
			fi
			# if desired display is different than wslg's default 0, check if WSLG socket doesn't already exist on X0
			# if yes, delete it aswell to avoid having the same wslg socket bound to two separate display numbers
			if test $wsl_wslg_display -ne 0; then
				if test -e /tmp/.X11-unix/X0 && test "$(readlink -f /tmp/.X11-unix/X0)" = "$wsl_mount_root/wslg/.X11-unix/X0"; then
					$wsl_windir/wsl.exe -d $wsl_distro -u root rm -Rf /tmp/.X11-unix/X0 /tmp/.X0-lock
				fi
			fi
			# create symlink to wslg socket
			$wsl_windir/wsl.exe -d $wsl_distro -u root ln -s $wsl_mount_root/wslg/.X11-unix/X0 /tmp/.X11-unix/X${wsl_wslg_display}
			# export updated display number for user's convenience
			export DISPLAY=:${wsl_wslg_display}
        fi
fi

export PULSE_SERVER=unix:$(sed 's/unix://g' <<< "$PULSE_SERVER")
export GDK_BACKEND=wayland

dbus-launch --exit-with-session &>/dev/null

genie -s 2>/dev/null

#experimental - uncomment/change the following line if you want another theme
#export GTK-THEME=HighContrastInverse
