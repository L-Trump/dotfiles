#!/bin/env bash
XFILE=$HOME/.xsettingsd
if [ -n "$(grep -E '^Net/ThemeName *".*-dark"$' $XFILE)" ]; then
	sed -i 's/^\(Net\/ThemeName[[:blank:]]*\)"\(.*\)-dark"$/\1"\2"/;' $XFILE
	pkill -HUP xsettingsd
fi
