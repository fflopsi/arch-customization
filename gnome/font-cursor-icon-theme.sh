#!/usr/bin/env bash

# Change font, icon theme and customize cursor theme

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
cd $SCRIPT_DIR

printf '\nSetting monospace font to "TerminessTTF Nerd Font Mono Bold 13"...\n'
yay -Syu --needed ttf-terminus-nerd
gsettings set org.gnome.desktop.interface monospace-font-name "TerminessTTF Nerd Font Mono Bold 13"

printf '\nSetting icon theme to "Papirus"...\n'
gsettings set org.gnome.desktop.interface icon-theme "Papirus"
gdm-icon-theme.sh

printf '\nModifying and applying cursor theme "Qogir"...\n'
mkdir -p $HOME/.icons/Qogir-flopsi
cp -r /usr/share/icons/Qogir/cursors $HOME/.icons/Qogir-flopsi
cd $HOME/.icons/Qogir-flopsi/cursors
ln -sf crosshair default
cd $SCRIPT_DIR
gsettings set org.gnome.dektop.interface cursor-theme "Qogir-flopsi"
