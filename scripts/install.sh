#!/bin/sh

echo -e "Installing Amoled theme...\n"

# Check if running on developer's computer. If so, no need to run cp command
[ ! -d ~/amoled-project ] && cp -rv amoled/.* ~

echo -e "Copying project contents to system...\n"
cp -rv amoled/.* ~

echo -e "Uncompressing icon theme...\n"
cd ~/.local/share/icons/; tar -xzf amoled-icons.tar.gz

# Needed to allow KDE cursor theme to work in GTK
gsettings set org.gnome.desktop.interface cursor-theme Amoled

