#!/bin/bash


if (python -mplatform | grep -qi Ubuntu)
then
    echo "Ubuntu"
    echo "Updating..."
    sudo apt-get update

    # Install i3 window Manager
    echo "Installing i3..."
    sudo apt-get install i3

    # Fix for nautilus so that it doesn't try to show the desktop icons
    # every time you open it.
    echo "Fixing nautilus"
    gsettings set org.gnome.desktop.background show-desktop-icons false

    echo "Installing i3blocks"
    sudo apt install i3blocks
else
    echo "Fedora"
    echo "Updating..."
    sudo yum update
    sudo dnf install i3 i3status dmenu i3lock xbacklight feh conky
fi

# Install Node Version Manager: https://github.com/creationix/nvm
curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.0/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Install and set the latest version of node as the default.
nvm install node
nvm use node
nvm alias default node
