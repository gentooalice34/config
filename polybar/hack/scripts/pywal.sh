#!/usr/bin/env bash

# Color files
PFILE="$HOME/.config/polybar/hack/colors.ini"
RFILE="$HOME/.config/polybar/hack/scripts/rofi/colors.rasi"
WFILE="$HOME/.cache/wal/colors.sh"

# Get colors
pywal_get() {
	wal -i "$1" -q -t --backend colorthief
}

# Change colors
change_color() {
	# polybar
	sed -i -e "s/background = #.*/background = $BG/g" $PFILE
	sed -i -e "s/foreground = #.*/foreground = $FG/g" $PFILE
	sed -i -e "s/primary = #.*/primary = $AC/g" $PFILE
	
	# rofi
	cat > $RFILE <<- EOF
	/* colors */

	* {
	  al:    #00000000;
	  bg:    ${BG}FF;
	  ac:    ${AC}FF;
	  se:    ${AC}26;
	  fg:    ${FG}FF;
	}
	EOF
	
	polybar-msg cmd restart
}

