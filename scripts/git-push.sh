#!/bin/sh

~/scripts.bak/./copy-to-projectfolder.sh

cd /home/user/amoled-project
git add --all
git status
git commit -m "Updated project." && echo "Updating online git repo..." || echo "Exiting...";

echo -ne "\nusername: bathtime\npassword: "
cat /home/user/git-token

exit
git push origin


echo "View changes at: https://github.com/bathtime/amoled"


