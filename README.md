# WSLg.Ubuntu-CommPrev.postflight
postflight script for a working systemd-genie environment with WSLg and Ubuntu-CommPrev

quick-n-dirty, needs lot of improvement and all yet to be tested.

change locale in setup.sh to your liking, default is en-EN.UTF8

Requirements:
1. WSL2 + WSLg supported system (HyperV + 10 insider/11 release + WDDM 3.0 driver)

2. WSL preview (store) / WSLg (github)
see
- https://github.com/microsoft/wslg
- https://aka.ms/wslstorepage
set default-version to 2

4. Ubuntu-CommPrev (store)
- https://www.microsoft.com/store/apps/9P9Q5ZH1HRR0

Run Ubuntu Community Preview
set language, create user - do not enable GUI-support in advanced options!

All set? Run setup.cmd and report issues here.
