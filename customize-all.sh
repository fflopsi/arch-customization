#!/usr/bin/env bash

# Run this script to apply all customizations in this repository

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cd $SCRIPT_DIR

read -n 1 -p 'Install packages from the official repositories? Y/n: ' PACMAN
if [[ $PACMAN =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling from packages/pacman...\n\n'
    sudo pacman -Syu --needed - < packages/pacman
else
    printf '\nSkipping.\n'
fi

read -n 1 -p 'Install packages from the AUR? Y/n: ' AUR
if [[ $AUR =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling from packages/aur...\n\n'
    yay -Syu --needed - < packages/aur
else
    printf '\nSkipping.\n'
fi

read -n 1 -p 'Install packages for laptops? y/N: ' LAPTOP
if [[ $LAPTOP =~ ^(y|Y)$ ]]; then
    printf '\nInstalling from packages/laptop...\n\n'
    yay -Syu --needed - < packages/laptop
else
    printf '\nSkipping.\n'
fi

if [[ -f /bin/zsh ]]; then
    printf '\nChanging shell to zsh...\n'
    chsh -s /bin/zsh
fi

printf '\nSetting monospace font to "TerminessTTF Nerd Font Mono Bold 13"...\n'
gsettings set org.gnome.desktop.interface monospace-font-name "TerminessTTF Nerd Font Mono Bold 13"

printf '\nSetting icon theme to "Papirus"...\n'
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
gnome/gdm-icon-theme.sh

printf '\nModifying and applying cursor theme "Qogir"...\n'
mkdir -p $HOME/.icons/Qogir-flopsi
cp -r /usr/share/icons/Qogir/cursors $HOME/.icons/Qogir-flopsi
cd $HOME/.icons/Qogir-flopsi/cursors
ln -sf crosshair default
cd $SCRIPT_DIR
gsettings set org.gnome.dektop.interface cursor-theme "Qogir-flopsi"

cd gnome

printf '\nCopying "change-theme" script...\n'
mkdir -p $HOME/.local/bin
cp change-theme $HOME/.local/bin
printf '\nIn 10 seconds, the theme will be changed, and then changed back after 5 seconds.\n'
sleep 10
printf 'First change...\n'
$HOME/.local/bin/change-theme
sleep 5
printf 'Second change...\n'
$HOME/.local/bin/change-theme
read -s -n 1 -p 'Fix issues with the theme-changing now, and press any key to continue...'

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
    printf '\nCreating directories GoogleDrive and OneDrive in $HOME...\n'
    mkdir $HOME/GoogleDrive
    mkdir $HOME/OneDrive
    printf '\nOpening rclone configurator (create two new remotes, named "googledrive" and "onedrive")...\n\n'
    rclone config
    printf '\nCreating systemd units...\n'
    mkdir -p $HOME/.config/systemd/user
    cat > $HOME/.config/systemd/user/googledrive.service <<- EOM
[Unit]
Description=Google Drive mount via rclone

[Service]
ExecStart=/usr/bin/rclone --vfs-cache-mode writes mount googledrive: $HOME/GoogleDrive

[Install]
WantedBy=multi-user.target
EOM
    cat > $HOME/.config/systemd/user/onedrive.service <<- EOM
[Unit]
Description=OneDrive mount via rclone

[Service]
ExecStart=/usr/bin/rclone --vfs-cache-mode writes mount onedrive: $HOME/OneDrive

[Install]
WantedBy=multi-user.target
EOM
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
