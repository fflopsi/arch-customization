#!/usr/bin/env bash

# Run this script to apply all customizations in this repository

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $SCRIPT_DIR/packages

./install.sh

if [[ -f /bin/zsh ]]; then
    printf '\nChanging shell to zsh...\n'
    chsh -s /usr/bin/zsh
fi

cd $SCRIPT_DIR/gnome

./font-cursor-icon-theme.sh

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

./extensions.sh

cd $SCRIPT_DIR/zsh

printf '\nCopying .zshrc and .zshenv...\n'
cp .zshrc $HOME
cp .zshenv $HOME

cd $SCRIPT_DIR/other

read -n 1 -p 'Configure rclone now? Y/n: ' RCC
if [[ $RCC =~ ^(|y|Y)$ ]]; then
    ./rclone-setup.sh
fi

read -n 1 -p 'Do you want to enable touchscreen support for Firefox? Y/n: ' FIREFOX_TOUCH
if [[ $FIREFOX_TOUCH =~ ^(|y|Y)$ ]]; then
    printf '\nEnabling Firefox touchscreen support...\n'
    ./firefox-touchscreen-support.sh
else
    printf '\nSkipping.\n'
fi

printf '\n\n\033[1mReboot your system to apply all changes.\033[0m\n\n'
