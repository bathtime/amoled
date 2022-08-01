#!/bin/sh

echo -e "Installing Amoled theme...\n"

exit

cp -rv amoled/.* ~

cd ~/.local/share/icons/; tar -xvzf amoled-icons.tar.gz

gsettings set org.gnome.desktop.interface cursor-theme Amoled

