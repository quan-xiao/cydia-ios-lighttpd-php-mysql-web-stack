#!/bin/bash

# This Script based on a script from Wizardry and Steamworks
# It was modified by J.Anrugas

# Copyright (C) Wizardry and Steamworks.
#
#  Licensed to Wizardry and Steamworks under
# the GPLv3 GNU License which can be found at:
#    http://www.gnu.org/licenses/gpl.html
#
# http://was.fm/ios:launchd_and_mysql
#
 
function throttleBlock() {
  MYSQLD=`ps ax | grep '[m]ysqld' | grep 'libexec' | awk '{ print $1 }'`
   while [[ (( "$1" == "off"  && "$MYSQLD" != "" ))  || (( "$1" == "on" && "$MYSQLD" == "" ))]]; do
     sleep 0.1 # don't mess with blocking sleeps
     MYSQLD=`ps ax | grep '[m]ysqld' | grep 'libexec' | awk '{ print $1 }'`
   done

#Check twice, regarding MsSQL stops immediately due to an internal error
#Bad hack but it works.....
  sleep 4
  MYSQLD=`ps ax | grep '[m]ysqld' | grep 'libexec' | awk '{ print $1 }'`
   if [[ ( "$1" == "on" && "$MYSQLD" == "" )]]; then
     sleep 12 #if we do not wait, launchd will start this script again and again and again and ...
  fi
}
 
SETTING=`plutil -key mysql_Enabled /var/mobile/Library/Preferences/com.atv.lighttpd_mysql.plist`
if [ $SETTING -eq 0 ]; then
  /usr/local/libexec/mysql_launcher stop
  throttleBlock off
else
  /usr/local/libexec/mysql_launcher start
  throttleBlock on
fi
