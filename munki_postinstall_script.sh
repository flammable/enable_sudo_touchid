#!/bin/bash

sed="/usr/bin/sed"

enable_touchid="auth       sufficient     pam_tid.so"

${sed} -i '' -e "1s/^//p; 1s/^.*/${enable_touchid}/" /etc/pam.d/sudo

exit
