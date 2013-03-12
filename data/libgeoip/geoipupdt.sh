#!/bin/sh
#File name: geoipupdt.sh
#Author: Patrick K. Frei
#Date: April 20, 2011
#Information and further notes:
#a) This script downloads and automatically installs the newest GeoIP database
#   library from maxmind.com (e.g. monthly via cron-job in /etc/crontab).
#b) You don't have to adjust the paths and file names below if you didn't change
#   the according GeoIP settings in webalizer.conf, too.
#c) Before running this script:
#   - set its permissions to chmod 744
#   - carefully read the installation instructions for GEOIP library support in
#     the INSTALL file of Webalizer Xtended.
TGTD="/usr/local/share/GeoIP/"
SRCD="http://geolite.maxmind.com/download/geoip/database/GeoLiteCountry/"
FILE1="GeoIP.dat.gz"
FILE2="GeoIP.dat"
cd $TGTD
wget $SRCD$FILE1
gunzip -f $FILE1
chown 0:0 $FILE2
chmod 0644 $FILE2

