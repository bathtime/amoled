#!/bin/bash

path="/home/user/amoled-project"

rm -rf $path/*



cd ~

cp -r scripts.bak/* scripts/

#files=(scripts .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/icons/Simply-Cyan-Circles .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)

files=(scripts .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)

#files=(.local/share/color-schemes)


for file in "${files[@]}" ; do
    mkdir -p "$path/$file"

    cp -R "$file" "$path/$(dirname $file)"
done






