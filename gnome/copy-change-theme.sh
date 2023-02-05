#!/usr/bin/env bash

# Copy the "change-theme" script and test it

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
