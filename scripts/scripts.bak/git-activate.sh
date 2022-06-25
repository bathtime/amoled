#!/bin/sh

rm -rf ~/amoled-project
rm -rf ~/.gitconfig

git config --global init.defaultBranch main 

git config --global user.name "bathtime"
git config --global user.email "andresmail@protonmail.com"

mkdir ~/amoled-project
cd ~/amoled-project

git init


git remote add origin https://github.com/bathtime/amoled
git config pull.rebase true


git pull https://github.com/bathtime/amoled.git main

echo -e "\nToken below:\n"
cat ~/git-token

git push --set-upstream origin main


