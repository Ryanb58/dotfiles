#!/bin/bash


if (python -mplatform | grep -qi Ubuntu)
then
    echo "Ubuntu"
    echo "Updating..."
    sudo apt-get update
    # Fix for nautilus so that it doesn't try to show the desktop icons
    # every time you open it.
    echo "Fixing nautilus"
    gsettings set org.gnome.desktop.background show-desktop-icons false
else
    echo "Fedora"
    echo "Updating..."
    sudo yum update
fi
