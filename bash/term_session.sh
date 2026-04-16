#!/usr/bin/env bash

setname_session() {
    session="$1"
	if [ -z "$session" ]; then
	 echo "error: empty session name"
	fi
	echo -e "\e]0;$session\a"
}

setname_session "$1"
