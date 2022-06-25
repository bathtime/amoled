#!/bin/bash

path="/home/user/amoled-project/"


cd ~

#files=(.local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids/org.kde.activeWindowControl .local/share/color-schemes/Amoled* .local/share/icons/Simply-Cyan-Circles .local/share/fonts/larabie* .config/gtk-* .config/*rc)

files=(scripts .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/icons/Simply-Cyan-Circles .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)


for file in "${files[@]}" ; do
    echo "Copying $path$file to $file..."
    mkdir -p "$path$file"
    cp -r "$pathfile" "$file"
done






