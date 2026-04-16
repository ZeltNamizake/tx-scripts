#!/usr/bin/env bash


dir="$PWD/dailylog"
file="$(date +%F.log)"

dailylog() {
    if [ -z "$1" ]; then
     echo "empty text. try again"
     return 1
    fi

    mkdir -p "$dir"
	echo "$(date +%F) | $1" >> "$dir/$file"
}

dailylog "$1"
