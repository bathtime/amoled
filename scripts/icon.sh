#!/bin/sh

COLOR='#00ffff'

cd ~/.local/share/icons/Darcwaita-Plus/scalable/apps


for file in * ; do

echo "Processing $file..."
sed -i "s/rl(#gradient)/$COLOR/g" "$file"
sed -i "s/#dbdbdb/$COLOR/g" "$file"
sed -i "s/#DBDBDB/$COLOR/g" "$file"
sed -i "s/#fdfdfd/$COLOR/g" "$file"
sed -i "s/#ececec/$COLOR/g" "$file"
sed -i "s/#fefefe/$COLOR/g" "$file"
sed -i "s/#aaaaaa/$COLOR/g" "$file"
sed -i "s/fill#a0a0a0/$COLOR/g" "$file"
sed -i "s/#ececec/$COLOR/g" "$file"
sed -i "s/#ececec/$COLOR/g" "$file"

done







