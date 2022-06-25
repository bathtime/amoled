#!/bin/bash

path="/home/user/amoled-project/"


cd ~

#files=(scripts .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/icons/Simply-Cyan-Circles .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)

files=(scripts .local/share/plasma/desktoptheme/amoled .local/share/aurorae/themes/amoled .config/Kvantum/amoled .local/share/plasma/plasmoids .local/share/color-schemes .local/share/fonts .config/gtk-3.0 .config/gtk-4.0)


for file in "${files[@]}" ; do
	cp -rv "$path$file" "$(dirname $file)"
done






