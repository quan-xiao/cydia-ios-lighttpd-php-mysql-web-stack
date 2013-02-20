echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"
echo PHP_PATH = "$(PKG_DEST_ php53)"


mkdir -p ${PKG_DEST}/etc
mkdir -p ${PKG_DEST}/var/www

#PHP
cp ${PKG_DATA}/com.ios.webserver.php.ini ${PKG_DEST}/etc/
cp ${PKG_DATA}/com.ios.webserver.mod_fastcgi.conf ${PKG_DEST}/etc/
cp ${PKG_DATA}/com.ios.webserver.load_all.ini ${PKG_DEST}/etc/

#Lighttpd
cp  ${PKG_DATA}/com.ios.webserver.lighttpd.conf ${PKG_DEST}/etc/

cp  ${PKG_DATA}/adminer.php ${PKG_DEST}/var/www/

#The BigBoss told me that this packages must includes all files from the packages PHP53
#Therefore copy all files from PHP53 to this packages. (You have to compile PHP53 before)
cp -r "$(PKG_DEST_ php53)"/* "${PKG_DEST}"/

