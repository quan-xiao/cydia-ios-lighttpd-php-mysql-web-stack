echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

mkdir -p ${PKG_DEST}/var/www/joomla
cp -r ${PKG_WORK}/* ${PKG_DEST}/var/www/joomla
