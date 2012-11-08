#!/bin/bash
# Copyright (C) Wizardry and Steamworks.
#
#  Licensed to Wizardry and Steamworks under
# the GPLv3 GNU License which can be found at:
#    http://www.gnu.org/licenses/gpl.html
#

STATUS=`ps -ax | grep '[l]ighttpd' | awk '{ print $1 }'`

SETTING=`plutil -key lighttpd_Enabled /private/var/mobile/Library/Preferences/com.atv.lighttpd_mysql.plist`

if [ $SETTING -eq 0 ]; then
  kill -s TERM $STATUS
else
  lighttpd-angel -f /etc/lighttpd/lighttpd-atv.conf
fi

