echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

mkdir -p ${PKG_DEST}/var/www/typo3_introduction
cp -r  ${PKG_WORK}/introductionpackage-*/* ${PKG_DEST}/var/www/typo3_introduction/

mkdir -p ${PKG_DEST}/etc/lighttpd
cp ${PKG_DATA}/mod_typo3_intro_package.conf ${PKG_DEST}/etc/lighttpd
