echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

${PKG_TARG}-gcc ${PKG_DATA}/mysql_launcher.c -o mysql_launcher


mkdir -p ${PKG_DEST}/etc
mkdir -p ${PKG_DEST}/usr/local/libexec
mkdir -p ${PKG_DEST}/Library/LaunchDaemons
mkdir -p ${PKG_DEST}/Library/PreferenceLoader/Preferences


#PHP
cp ${PKG_DATA}/com.atv.web-stack.php.ini ${PKG_DEST}/etc/
cp ${PKG_DATA}/com.atv.web-stack.mod_fastcgi-atv.conf ${PKG_DEST}/etc/
cp ${PKG_DATA}/com.atv.web-stack.load_all.ini ${PKG_DEST}/etc/

#Lighttpd
cp  ${PKG_DATA}/com.atv.web-stack.lighttpd-atv.conf ${PKG_DEST}/etc/


#Preferenc Launcer lighttpd_mysql

chmod 755 ${PKG_DATA}/lighttpd_launcher.sh
chmod 755 ${PKG_DATA}/mysql_manager.sh

cp  ${PKG_DATA}/lighttpd_launcher.sh ${PKG_DEST}/usr/local/libexec/
cp  ${PKG_DATA}/mysql_manager.sh ${PKG_DEST}/usr/local/libexec/

cp  ${PKG_WORK}/mysql_launcher ${PKG_DEST}/usr/local/libexec/
cp  ${PKG_DATA}/atv.lighttpd_mysql.settings.plist ${PKG_DEST}/Library/PreferenceLoader/Preferences/
cp  ${PKG_DATA}/com.atv.lighttpd.switch.plist ${PKG_DEST}/Library/LaunchDaemons/
cp  ${PKG_DATA}/com.atv.mysql.switch.plist ${PKG_DEST}/Library/LaunchDaemons/


cp  ${PKG_DATA}/atv.lighttpd_mysql.png ${PKG_DEST}/Library/PreferenceLoader/Preferences/
cp  ${PKG_DATA}/atv.lighttpd_mysql@2x.png ${PKG_DEST}/Library/PreferenceLoader/Preferences/
