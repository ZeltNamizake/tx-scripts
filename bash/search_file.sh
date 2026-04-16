#!/usr/bin/env bash

main() {
	case "$1" in
	 name)
	  search_filename "$2" "$3"
	  ;;
	 ext)
	  search_extension "$2" "$3"
	  ;;
	 *)
	  help
	  ;;
	 esac
}

search_filename() {
	if [[ -z "$1" || -z "$2" ]]; then
	 echo "Usage: name <filename> <directory>"
	 return 1
	fi

	local result
	result=$(find "$2" -name "*$1*" 2>/dev/null)

	if [ -z "$result" ]; then
	 echo "'$1' file not found in $2"
	 return 1
	fi

	echo "$result"
}

search_extension() {
	if [[ -z "$1" || -z "$2" ]]; then
	 echo "Usage: ext <extension> <directory>"
	 return 1
	fi

	local result
	result=$(find "$2" -type f -iname "*.$1" 2>/dev/null)

	if [ -z "$result" ]; then
	 echo "'$1' extension not found in '$2'"
	 return 1
	fi

	echo "$result"
}

help() {
	echo "Usage:"
	echo "  name <filename> <path> 	Search filename"
	echo "  ext  <extension> <path>	Search filename by extension"
}

main "$@"
