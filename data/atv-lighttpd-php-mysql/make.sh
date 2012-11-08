echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"


mkdir -p ${PKG_DEST}/etc
mkdir -p ${PKG_DEST}/Library/LaunchDaemons
mkdir -p ${PKG_DEST}/var/www

#PHP
cp ${PKG_DATA}/com.atv.web-stack.php.ini ${PKG_DEST}/etc/
cp ${PKG_DATA}/com.atv.web-stack.mod_fastcgi-atv.conf ${PKG_DEST}/etc/
cp ${PKG_DATA}/com.atv.web-stack.load_all.ini ${PKG_DEST}/etc/

#Lighttpd
cp  ${PKG_DATA}/com.atv.web-stack.lighttpd-atv.conf ${PKG_DEST}/etc/

#Daemon
cp ${PKG_DATA}/com.atv.lighttpd.plist ${PKG_DEST}/Library/LaunchDaemons
cp ${PKG_DATA}/com.atv.mysql.plist ${PKG_DEST}/Library/LaunchDaemons

cp  ${PKG_DATA}/adminer.php ${PKG_DEST}/var/www/
