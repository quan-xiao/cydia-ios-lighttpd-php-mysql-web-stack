echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

mkdir -p ${PKG_DEST}/etc
cp  ${PKG_DATA}/ios-lighttpd-php-mysql.prerm.patch ${PKG_DEST}/etc/
