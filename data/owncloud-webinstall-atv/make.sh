echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

#pkg:setup

mkdir -p ${PKG_DEST}/var/www
mkdir -p ${PKG_DEST}/etc/lighttpd
cp ${PKG_DATA}/setup-owncloud.php ${PKG_DEST}/var/www
cp ${PKG_DATA}/mod_owncloud.conf  ${PKG_DEST}/etc/lighttpd
