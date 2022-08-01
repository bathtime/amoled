#!/bin/bash


path="/home/user/amoled-project"

echo "Copying backup script folder..."
cd ~
cp -r scripts.bak/* scripts/ || (echo "Creating new scripts.bak directory."; cp -r scripts scripts.bak)


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
.config/kdedefaults
.config/kdeglobals
.config/kateschemarc
.config/konsolerc
.config/konquerorrc
.config/kwinrc
.config/okularpartrc
.config/plasmarc
.config/plasmashellrc
.config/plasma-org.kde.plasma.desktop-appletsrc
.config/spectaclerc
.config/Trolltech.conf
.config/gtk-3.0/
.config/gtk-4.0/
.config/inkscape/
.config/kdedefaults/
.config/kdeglobals
.config/Kvantum/amoled/
.config/Kvantum/kvantum.kvconfig
.config/vlc/
.icons/Amoled/
.icons/default/index.theme
.local/share/aurorae/themes/amoled/
.local/share/color-schemes/
.local/share/dolphin/dolphinstaterc
.local/share/fonts/
.local/share/icons/amoled-icons.tar.gz
.local/share/kate/anonymous.katesession
.local/share/konsole/
.local/share/kxmlgui5/
.local/share/plasma/desktoptheme/amoled/
.local/share/plasma/look-and-feel/Amoled/
.local/share/plasma/plasmoids/
.local/share/wallpapers/amoled/
screenshots/
scripts/
)


for file in "${files[@]}" ; do

    echo "Processing $file..."
    mkdir -p "$path/$(dirname $file)"
    cp -R "/home/user/$file" "$path/$file"

done





