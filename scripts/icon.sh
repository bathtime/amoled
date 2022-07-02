#!/bin/bash


COLOR="#00ffff"
file="$1"

#dir=/home/user/.local/share/icons/Clarity/static
#dir=/home/user/.local/share/icons/Darcwaita-Plus/s
dir=/home/user/.local/share/icons/Simply-Cyan-Circles/symbolic

cd $dir

for file in */*.svg; do

echo "Processing $file..."

# Clarity icons
#sed -i "s/style=\"fill:#.*\"//g" "$file"
#sed -i "s/style=\"fill:url.*\"//g" "$file"

#sed -i "s/   <path id=/\n<path\nclass=\"ColorScheme-Highlight\"\nstyle=\"fill:currentColor\"\n\nd=/g" "$file"
#sed -i "s/   <path d=/\n<path\nclass=\"ColorScheme-Highlight\"\nstyle=\"fill:currentColor\"\n\nd=/g" "$file"

#sed -i "s/    <\/defs>/\<style\nid=\"current-color-scheme\"\ntype=\"text\/css\">\n.ColorScheme-Highlight\n { color:$COLOR; }\n<\/style>\n<\/defs>/g" "$file"

#sed -i "s/<\/metadata>$/<\/metadata><defs>\n<style\nid=\"current-color-scheme\"\ntype=\"text\/css\">\n.ColorScheme-Highlight\n { color:$COLOR; }\n<\/style>\n<\/defs>/g" "$file"

# Darcwaita-Plus

sed -i "s/style=\"fill:url.*\"/style=\"fill:$COLOR\"/g" "$file"
sed -rEi "s/fill[=|:]\#[a-fA-F0-9]+/fill:$COLOR/g" "$file"
sed -rEi "s/fill[=|:]\"\#[a-fA-F0-9]+\"?/fill=\"$COLOR\"/g" "$file"

sed -rEi "s/stroke[=|:]\"\#[a-fA-F0-9]+\"?/stroke=\"$COLOR\"/g" "$file"
sed -rEi "s/color[=|:]\#[a-fA-F0-9]+/color:$COLOR/g" "$file"
sed -rEi "s/color[=|:]\"\#[a-fA-F0-9]+\"?/color=\"$COLOR\"/g" "$file"

done







