#!/usr/bin/env bash
termux_font_changer() {
	filefont="$1"

	if [ -z "$filefont" ]; then
	 echo "missing file operand"
	 echo "please try again with filename.ttf"
	 return 1
	fi

	if [ ! -f "$filefont" ]; then
	 echo "$filefont: No such file or directory"
	 return 1
	fi

	mkdir -p "$HOME/.termux"
	cp "$filefont" ~/.termux/font.ttf
	am broadcast --user 0 -a com.termux.app.reload_style com.termux
}

termux_font_changer "$1"
