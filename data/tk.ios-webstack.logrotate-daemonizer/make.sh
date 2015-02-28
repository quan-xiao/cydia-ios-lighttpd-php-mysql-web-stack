echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"


pkg: mkdir -p /Library/LaunchDaemons
cp "${PKG_DATA}"/tk.ios-webstack.logrotate.plist "${PKG_DEST}"/Library/LaunchDaemons
