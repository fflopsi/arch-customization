#!/usr/bin/env bash

# Script to apply the "Papirus" icon theme to the gnome login screen gdm
# Change "Papirus" to something else to apply another icon theme

sudo -u gdm dbus-launch gsettings set org.gnome.desktop.interface icon-theme Papirus
