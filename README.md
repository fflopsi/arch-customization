# Arch Customization by fflopsi

Some files to customize an EndeavourOS (Arch Linux) installation to my liking

*To use this on Arch Linux, you may need to install some packages, like gnome, yay and firefox.*

## Usage

To apply all customizations, just run the script `customize-all.sh` located in the root directory of this repository.
Most of the customizations can be accepted or denied when running this script.

To only apply certain customizations, you can also run single scripts located in the different sub-directories.

## List of All Customizations

All these customizations are applied when running the script `customize-all.sh` in this order.

### Folder `packages`

- Install packages from official Arch repos
  - `zsh`
  - `zsh-syntax-highlighting`
  - `ttf-terminus-nerd`
  - `btop`
  - `thefuck`
  - `tldr`
  - `rclone`
  - `gnome-menus`
  - `papirus-icon-theme`
- Install packages from the AUR
  - `zsh-theme-powerlevel10k-git`
  - `adw-gtk3`
  - `gnome-browser-connector`
- Install additional packages for laptops
  - `iio-sensor-proxy`

### Folder `gnome`

- Change the default monospace font to Terminus Nerd
- Modify the cursor theme
- Change the icon theme to Papirus
- Change the icon theme on the gdm login screen to Papirus
- Add a script with a keyboard shortcut to change between light and dark mode
- Change the background
- Add some custom shortcuts
  - <kbd>Super</kbd>+<kbd>I</kbd> launches Settings
  - <kbd>Super</kbd>+<kbd>B</kbd> launches the default browser
  - <kbd>Super</kbd>+<kbd>C</kbd> launches Calculator
  - <kbd>Super</kbd>+<kbd>E</kbd> launches the Nautilus file explorer in the Home directory
  - <kbd>Ctrl</kbd>+<kbd>Super</kbd>+<kbd>R</kbd> instantly reboots
  - <kbd>Ctrl</kbd>+<kbd>Super</kbd>+<kbd>L</kbd> instantly quits the Gnome session (logout)
  - <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>Return</kbd> launches Gnome Console (kgx)
  - <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>Esc</kbd> launches btop in Gnome Console
  - <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>K</kbd> launches KeePass
  - <kbd>Ctrl</kbd>+<kbd>Alt</kbd>+<kbd>^</kbd> (the key left to the backspace key on Swiss keyboards) executes the aforementioned script to change between themes
- Apply some mouse and touchpad settings
  - Flat mouse acceleration profile
  - Enable tap to click on touchpad
- Apply some multitasking settings
  - Disable hot corner
  - Enable workspaces on all displays
  - Set app switcher to current workspace only
- Apply some top bar settings
  - Show weekday before date
  - Show seconds in clock
  - Show week number in calendar widget
- Copy the display settings to the gdm login screen
- Install some Gnome extensions
  - "Essential" extensions
    - [AppIndicator and KStatusNotifierItem Support](https://extensions.gnome.org/extension/615/appindicator-support/)
    - [Clipboard Indicator](https://extensions.gnome.org/extension/779/clipboard-indicator/)
    - [Gnome 4x UI Improvements](https://extensions.gnome.org/extension/4158/gnome-40-ui-improvements/)
    - [GSConnect](https://extensions.gnome.org/extension/1319/gsconnect/)
    - [Hide Activities Button](https://extensions.gnome.org/extension/744/hide-activities-button/)
    - [Quick Settings Tweaker](https://extensions.gnome.org/extension/5446/quick-settings-tweaker/)
  - "Additional" extensions
    - [Alphabetical App Grid](https://extensions.gnome.org/extension/4269/alphabetical-app-grid/)
    - [Applications Menu](https://extensions.gnome.org/extension/6/applications-menu/)
    - [Bluetooth Quick Connect](https://extensions.gnome.org/extension/1401/bluetooth-quick-connect/)
    - [Bring Out Submenu Of Power Off/Logout Button](https://extensions.gnome.org/extension/2917/bring-out-submenu-of-power-offlogout-button/)
    - [Material Shell](https://extensions.gnome.org/extension/3357/material-shell/)
    - [Vitals](https://extensions.gnome.org/extension/1460/vitals/)

### Folder `zsh`

- Copy custom `.zshrc` and `.zshenv` to `~`

### Folder `other`

- Setup and configure rclone for Google Drive and OneDrive
- Enable touchscreen gestures in Firefox
- Enable bluetooth services
