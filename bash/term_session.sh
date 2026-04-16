#!/usr/bin/env bash

setname_session() {
    session="$1"
	if [ -z "$session" ]; then
	 echo "error: empty session name"
	 return 1
	fi
	echo -e "\e]0;$session\a"
}

setname_session "$1"
