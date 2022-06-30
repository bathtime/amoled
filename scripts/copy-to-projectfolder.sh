#!/bin/bash

path="/home/user/amoled-project"

cd ~
cp -r scripts.bak/* scripts/
rm -rf $path/README.md $path/.local $path/.config $path/scripts $path/screenshots

cp README.md $path


files=(scripts screenshots .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)



for file in "${files[@]}" ; do
    mkdir -p "$path/$file"
    cp -R "$file" "$path/$(dirname $file)"
done






