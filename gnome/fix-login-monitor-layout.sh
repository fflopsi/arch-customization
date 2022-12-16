#!/bin/env zsh

# Script to fix monitor layout in the Gnome login screen
# Execute with root rights

sudo cp -v ~/.config/monitors.xml /var/lib/gdm/.config/
sudo chown gdm:gdm /var/lib/gdm/.config/monitors.xml
