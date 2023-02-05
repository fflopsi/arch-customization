#!/usr/bin/env bash

# Install the extensions listed in extensions.md

read -n 1 -p 'Install "essential" Gnome extensions? Y/n: ' GEX_E
if [[ $GEX_E =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling extensions...'
    yay -Syu gnome-shell-extension-installer
    gnome-shell-extension-installer 615 779 4158 1319 744 5446
fi
read -n 1 -p 'Install "additional" Gnome extensions? y/N: ' GEX_A
if [[ $GEX_A =~ ^(y|Y)$ ]]; then
    yay -Syu gnome-shell-extension-installer
    gnome-shell-extension-installer 4269 6 1401 2917 3357 1460
fi
read -n 1 -p 'Uninstall gnome-shell-extension-installer? y/N: ' UNINST_GSEI
if [[ $UNINST_GSEI =~ ^(y|Y)$ ]]; then
    yay -Rs gnome-shell-extension-installer
fi
