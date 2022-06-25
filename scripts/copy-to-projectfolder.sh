#!/bin/bash

path="/home/user/amoled/"

rm -rf "$path"
mkdir "$path"

cd ~


files=(scripts .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/icons/Simply-Cyan-Circles .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)


for file in "${files[@]}" ; do
    echo "Copying $file to $path$file..."
    mkdir -p "$path$file"
    cp -r "$file" "$path$file"
done






