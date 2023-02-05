#!/usr/bin/env bash

# Run this script to apply all customizations in this repository

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $SCRIPT_DIR

read -n 1 -p 'Install packages from the official repositories? Y/n: ' PACMAN
if [[ $PACMAN =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling from packages/pacman...\n\n'
    packages/install-packages-pacman.sh
else
    printf '\nSkipping.\n'
fi

read -n 1 -p 'Install packages from the AUR? Y/n: ' AUR
if [[ $AUR =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling from packages/aur...\n\n'
    packages/install-packages-aur-sh
else
    printf '\nSkipping.\n'
fi

read -n 1 -p 'Install packages for laptops? y/N: ' LAPTOP
if [[ $LAPTOP =~ ^(y|Y)$ ]]; then
    printf '\nInstalling from packages/laptop...\n\n'
    packages/install-packages-laptop.sh
else
    printf '\nSkipping.\n'
fi

if [[ -f /bin/zsh ]]; then
    printf '\nChanging shell to zsh...\n'
    chsh -s /bin/zsh
fi

gnome/font-cursor-icon-theme.sh

cd $SCRIPT_DIR/gnome

./copy-change-theme.sh

read -s -n 1 -p 'If you want to apply the wallpapers, make sure that you have clicked "Download more EndeavourOS wallpapers" in EOS Welcome. Press any key to continue...'
if [[ -f /usr/share/endeavouros/backgrounds/eos_wallpapers_classic/Endy_planet.png\
        && -f /usr/share/endeavouros/backgrounds/eos_wallpapers_classic/EOS-JWST.png ]]; then
    printf '\nSetting wallpapers...\n'
    ./background.sh
else
    printf '\nWallpapers not found.\n'
fi

printf '\nApplying custom shortcuts...\n'
./custom-shortcuts.sh

read -n 1 -p 'Apply current monitor layout to gdm login screen? y/N: ' MONITOR
if [[ $MONITOR =~ ^(y|Y)$ ]]; then
    printf '\nCopying monitor layout...\n'
    ./gdm-monitor-layout.sh
else
    printf '\nSkipping.\n'
fi

cd $SCRIPT_DIR

read -n 1 -p 'Configure rclone now? Y/n: ' RCC
if [[ $RCC =~ ^(|y|Y)$ ]]; then
    other/rclone-setup.sh
fi

printf '\nCopying .zshrc and .zshenv...\n'
cp zsh/.zshrc $HOME
cp zsh/.zshenv $HOME

read -n 1 -p 'Do you want to enable touchscreen support for Firefox? Y/n: ' FIREFOX_TOUCH
if [[ $FIREFOX_TOUCH =~ ^(|y|Y)$ ]]; then
    printf '\nEnabling Firefox touchscreen support...\n'
    other/firefox-touchscreen-support.sh
else
    printf '\nSkipping.\n'
fi

gnome/extensions.sh
