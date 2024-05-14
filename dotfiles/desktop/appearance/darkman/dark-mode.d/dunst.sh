#!/bin/env bash
FILE=$HOME/.config/dunst/dunstrc
sed -i 's/^\(\s*background\s*=\s"\).*\("\s*#\s*normal\)$/\1#18111e\2/;' $FILE
sed -i 's/^\(\s*foreground\s*=\s"\).*\("\s*#\s*normal\)$/\1#ffffff\2/;' $FILE
systemctl --user restart dunst.service
notify-send --app-name="darkman" -t 3000 --icon=weather-clear-night-symbolic "Darkman" "Switching to dark mode"
