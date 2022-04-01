# WSLg.Ubuntu-CommPrev.postflight

postflight script for a working systemd-genie environment with WSLg and Ubuntu-CommPrev

quick-n-dirty, needs lot of improvement and all yet to be tested.

change locale in setup.sh to your liking, default is en_US.UTF8

Requirements:
1. WSL2 + WSLg supported system (HyperV + 10 insider/11 release + WDDM 3.0 driver)

2. WSL preview (store) / WSLg (github)
see
- https://github.com/microsoft/wslg
- https://aka.ms/wslstorepage

  set default-version to 2

4. Ubuntu-CommPrev (store)
- https://www.microsoft.com/store/apps/9P9Q5ZH1HRR0

Now, first run Ubuntu Community Preview

-> set language, create user - do not enable GUI-support in advanced options!

------------------------

All set? Run setup.cmd and report issues here.

------------------------

extra info:

Window decorations I recommend (not working for X11 yet):

https://github.com/vinceliuice/Fluent-gtk-theme

https://github.com/vinceliuice/Fluent-icon-theme

add the line

```
export GTK-THEME=Fluent-round-dark
```
    
to /etc/bash.bashrc and use `gnome-tweaks` to set your theme/icons/cursor

(or uncomment/change the last line `#export GTK-THEME=HighContrastInverse`)

run firefox with `C:\Windows\System32\wslg.exe ~ -d Ubuntu-CommPrev MOZ_ENABLE_WAYLAND=1 firefox`
