#!/bin/env bash
cur_theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
cur_theme=${cur_theme#"'"}
cur_theme=${cur_theme%"'"}
if [ -z "$(echo $cur_theme  | grep -E '^.*-dark')" ]; then
	gsettings set org.gnome.desktop.interface gtk-theme "${cur_theme}-dark"
fi
