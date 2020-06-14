#!/bin/sh

grep="/usr/bin/grep"

enable_touchid="auth       sufficient     pam_tid.so"

if $(${grep} -q "${enable_touchid}" /etc/pam.d/sudo); then
	# Nothing to be done
	exit 1
fi

exit
