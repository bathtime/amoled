#!/bin/bash

path="/home/user/amoled-project/"

cd $path

cp -rv .* /home/user/

cd ~/.local/share/icons

echo "Erasing previous icons..."
rm -rf Amoled

echo "Extracting new icons..."
tar -xzf amoled-icons.tar.gz

exit


cd ~

files=(
.config/gtk-3.0
.config/gtk-4.0
.config/Kvantum/amoled
.local/share/icons/amoled-icons.tar.gz
.local/share/plasma/desktoptheme/amoled
.local/share/aurorae/themes/amoled
.local/share/plasma/plasmoids
.local/share/color-schemes
.local/share/fonts
screenshots
scripts
)


for file in "${files[@]}" ; do
	mkdir -p "$(dirname $file)"
	cp -rv "$path$file" "$(dirname $file)"
done

cd ~/.local/share/icons

echo "Erasing previous icons..."
rm -rf Amoled

echo "Extracting new icons..."
tar -xzf amoled-icons.tar.gz

