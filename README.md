# WSLg.Ubuntu-CommPrev.postflight

postflight script for a working systemd-genie environment with WSLg and Ubuntu-CommPrev

quick-n-dirty, needs lot of improvement. Edit: bugs found and fixed, see new release. Tested and seems to be working fine.

change locale in setup.sh to your liking, default is en_US.UTF8

Requirements:
1. WSL2 + WSLg supported system (HyperV + 10 insider/11 release + WDDM 3.0 driver)

2. WSL preview (store) / WSLg (github)
see
- https://github.com/microsoft/wslg
- https://aka.ms/wslstorepage

  set default-version to 2
  
  (`wsl.exe --set-default-version 2`)

4. Ubuntu-CommPrev (store)
- https://www.microsoft.com/store/apps/9P9Q5ZH1HRR0

  Now, first run Ubuntu Community Preview

-> set language, create user - do not enable GUI-support in advanced options!

5. make sure you can access WSL from explorer:

  i.e. [WIN]+[R]: `explorer.exe \\wsl.localhost\Ubuntu-CommPrev\`

------------------------

All set? Change locale in setup.sh if needed, run setup.cmd and report issues here, if any.

------------------------

extra info:

window decorations I recommend (not working for X11 yet):

https://github.com/vinceliuice/Fluent-gtk-theme

https://github.com/vinceliuice/Fluent-icon-theme

https://github.com/vinceliuice/Fluent-kde

add the line

```
export GTK-THEME=Fluent-round-dark
```
    
to /etc/bash.bashrc and use `gnome-tweaks` to set your theme/icons/cursor to Fluent-round(-dark)

(or just uncomment the last line `#export GTK-THEME=HighContrastInverse` for a simple dark theme)

run firefox with `C:\Windows\System32\wslg.exe ~ -d Ubuntu-CommPrev MOZ_ENABLE_WAYLAND=1 firefox`
