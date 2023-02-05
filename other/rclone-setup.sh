#!/usr/bin/env bash

# Setup and configure rclone for Google Drive and OneDrive

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
