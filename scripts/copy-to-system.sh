#!/bin/bash

path="/home/user/amoled-project/"


cd ~

files=(./local/share/icons/icons.tar.gz .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)


for file in "${files[@]}" ; do
	mkdir -p "$(dirname $file)"
	cp -rv "$path$file" "$(dirname $file)"
done

cd ~/.local/share/icons

echo "Erasing previous icons..."
rm -rf Clarity Darcwaita-Plus Simply-Cyan-Circles

echo "Extracting new icons..."
tar -xzf icons.tar.gz

