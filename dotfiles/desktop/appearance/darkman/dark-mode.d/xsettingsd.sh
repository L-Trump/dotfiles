#!/bin/env bash
XFILE=$HOME/.xsettingsd
if [ -z "$(grep -E '^Net/ThemeName *".*-dark"$' $XFILE)" ]; then
	sed -i 's/^\(Net\/ThemeName[[:blank:]]*\)"\(.*\)"$/\1"\2-dark"/;' $XFILE
	pkill -HUP xsettingsd
fi
