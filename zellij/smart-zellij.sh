#!/bin/bash

# Get count of active zellij sessions
sessions=$(zellij list-sessions 2>/dev/null | grep -v "EXITED" | wc -l)

case $sessions in
0)
	# No sessions, create "primary"
	zellij -s primary
	;;
1)
	# One session exists, create "secondary"
	zellij -s secondary
	;;
*)
	# Two or more sessions, just use shell
	exec $SHELL
	;;
esac
