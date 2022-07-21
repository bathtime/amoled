#!/bin/bash


path="/home/user/amoled-project"

echo "Copying backup script folder..."
cd ~
cp -r scripts.bak/* scripts/

echo "Erasing previous git files..."
cd $path
# Erase all but files/directories except .git
ls -A | grep -xv ".git" | xargs rm -rf


echo "Compressing icon directory..."
cd ~/.local/share/icons
rm -rf amoled-icons.tar.gz
tar -czf amoled-icons.tar.gz Amoled/

files=(
README.md
.config/dolphinrc
.config/gtkrc
.config/gwenviewrc
.config/katerc
.config/kateschemarc
.config/konsolerc
.config/konquerorrc
.config/kwinrc
.config/okularpartrc
.config/plasmarc
.config/plasmashellrc
.config/spectaclerc
.config/Trolltech.conf
.config/gtk-3.0/
.config/gtk-4.0/
.config/inkscape/
.config/kdedefaults/
.config/Kvantum/amoled/
.config/vlc/
.local/share/aurorae/themes/amoled/
.local/share/color-schemes/
.local/share/fonts/
.local/share/icons/amoled-icons.tar.gz
.local/share/konsole/
.local/share/plasma/desktoptheme/amoled/
.local/share/plasma/plasmoids/
screenshots/
scripts/
)


for file in "${files[@]}" ; do

    echo "Processing $file..."
    mkdir -p "$path/$(dirname $file)"
    cp -R "/home/user/$file" "$path/$file"

done






