#!/usr/bin/env bash

main() {
	case "$1" in
	 check)
	   check_branch
	   ;;
	 switch)
	   switch_branch "$2"
	   ;;
	 create)
	   create_branch "$2"
	   ;;
	 delete)
	   delete_branch "$2"
	   ;;
	 *)
	   help
	   ;;
	 esac
}

check_branch() {
    echo "Current branch: $(git branch --show-current)"
	echo "Branch availables:"
	local available
	available=$(git branch --color)

	if [ -z "$available" ]; then
	 echo "* not available"
	 return 1
	fi

	echo "$available"
}

switch_branch() {
	if [ -z "$1" ]; then
	 echo "Usage: switch <branch>"
	 return 1
	fi

	git switch "$1"
}

create_branch() {
	if [ -z "$1" ]; then
	 echo "Usage: create <branch>"
	 return 1
	fi

	git branch "$1"
	echo "Successfully created: $1"
}

delete_branch() {
	if [ -z "$1" ]; then
	 echo "Usage: delete <branch>"
	 return 1
	fi

	local current
	current=$(git branch --show-current)

	if [ "$1" = "$current" ]; then
	 echo "Cannot delete current branch: $1"
	 return 1
	fi

	git branch -d "$1"

}

help() {
	echo "Usage:"
	echo " check 			Show available and current"
	echo " switch <branch>	Switch branch"
	echo " create <branch>	Create branch"
	echo " delete <branch>	Delete branch"
}

main "$@"
