SETTING=`plutil -key NetatalkEnabled /var/mobile/Library/Preferences/com.atv.netatalk.plist`

if [ $SETTING -eq 0 ]; then
  launchctl unload /Library/LaunchDaemons/com.atv.netatalk.dns-sd.plist
  launchctl unload /Library/LaunchDaemons/com.atv.netatalk.afpd.plist
else
  launchctl load /Library/LaunchDaemons/com.atv.netatalk.dns-sd.plist
  launchctl load /Library/LaunchDaemons/com.atv.netatalk.afpd.plist
fi
