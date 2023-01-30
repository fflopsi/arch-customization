#!/usr/bin/env bash

# Add a necessary line to a file to enable full touchscreen support for Firefox

sudo echo MOZ_USE_XINPUT2 DEFAULT=1 >> /etc/security/pam_env.conf
