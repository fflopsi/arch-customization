#!/usr/bin/env bash

# Install packages from the files in this directory

read -n 1 -p 'Install packages from the official repositories? Y/n: ' PACMAN
if [[ $PACMAN =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling from packages/pacman...\n\n'
    sudo pacman -Syu --needed - < pacman
else
    printf '\nSkipping.\n'
fi
read -n 1 -p 'Install packages from the AUR? Y/n: ' AUR
if [[ $AUR =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling from packages/aur...\n\n'
    yay -Syu --needed - < aur
else
    printf '\nSkipping.\n'
fi
read -n 1 -p 'Install packages for laptops? y/N: ' LAPTOP
if [[ $LAPTOP =~ ^(y|Y)$ ]]; then
    printf '\nInstalling from packages/laptop...\n\n'
    yay -Syu --needed - < laptop
else
    printf '\nSkipping.\n'
fi

read -n 1 -p "Install IDE's? Y/n: " IDE
if [[ $IDE =~ ^(|y|Y)$ ]]; then
    printf "\nInstalling IDE's...\n\n"
    yay -Syu --needed - < ides
else
    printf '\nSkipping.\n'
fi

read -n 1 -p 'Install flatpak and flatpak packages? Y/n: ' FLATPAKS
if [[ $FLATPAKS =~ ^(|y|Y)$ ]]; then
    printf '\nInstalling flatpaks...\n\n'
    sudo pacman -Syu flatpak
    sudo pacman -Rns firefox
    flatpak install flathub com.github.tchx84.Flatseal org.mozilla.firefox org.gnome.World.Secrets com.mattjakeman.ExtensionManager
else
    printf '\nSkipping.\n'
fi
