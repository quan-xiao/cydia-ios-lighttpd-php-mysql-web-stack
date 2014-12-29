echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"


# Create folders
pkg: mkdir -p /Library/LaunchDaemons
pkg: mkdir -p /var/mobile/Library/Preferences
pkg: mkdir -p /Library/PreferenceLoader/Preferences
pkg: mkdir -p /usr/local/libexec

# Copy all files
cp ${PKG_DATA}/atv.netatalk.plist ${PKG_DEST}/Library/PreferenceLoader/Preferences
cp ${PKG_DATA}/atv.netatalk.png ${PKG_DEST}/Library/PreferenceLoader/Preferences
cp ${PKG_DATA}/atv.netatalk@2x.png ${PKG_DEST}/Library/PreferenceLoader/Preferences
cp ${PKG_DATA}/com.atv.netatalk.switch.plist ${PKG_DEST}/Library/LaunchDaemons
cp ${PKG_DATA}/netatalk_launcher.sh ${PKG_DEST}/usr/local/libexec
chmod 755 ${PKG_DEST}/usr/local/libexec/netatalk_launcher.sh

touch ${PKG_DEST}/var/mobile/Library/Preferences/com.atv.netatalk.plist 






