#!/bin/sh

~/scripts.bak/./copy-to-projectfolder.sh

cd /home/user/amoled-project
git add --all
git status
git commit -m "Updated project."

echo -ne "\nusername: bathtime\npassword: "
cat /home/user/git-token

git push origin

# || (git pull -v && git push origin)




