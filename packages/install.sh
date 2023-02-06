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
