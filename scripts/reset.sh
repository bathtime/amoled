#!/bin/sh

rm -rf ~/.cache

cd ~/.config
for j in plasma*; do mv -- "$j" "${j%}.bak"; done

rm ~/.config/Trolltech.conf
kbuildsycoca5 --noincremental


