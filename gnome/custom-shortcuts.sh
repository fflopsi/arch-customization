#!/bin/env zsh

# Script to import the custom shortcuts from the .conf file

dconf load / < custom-shortcuts.conf

# Comment the line above and uncomment below to EXPORT the current custom shortcuts

#dconf dump / | sed -n '/\[org.gnome.settings-daemon.plugins.media-keys/,/^$/p' > custom-shortcuts-NEW.conf
