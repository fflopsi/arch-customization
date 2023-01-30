#!/usr/bin/env bash

# Script to fix monitor layout in the Gnome login screen

sudo cp -v ~/.config/monitors.xml /var/lib/gdm/.config/
sudo chown gdm:gdm /var/lib/gdm/.config/monitors.xml
