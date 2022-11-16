#!/bin/env zsh

# Script to import the background URIs from the .conf file

# Before running this script:
# Make sure to click "Download more EndeavourOS wallpapers" in EOS Welcome (tab "After Install") to download the images

dconf load / < background.conf

# Comment the line above and uncomment below to EXPORT the current background settings

#dconf dump / | sed -n '/\[org.gnome.desktop.background/,/^$/p' > background.conf
