echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

pkg: mkdir -p /usr
pkg: mkdir -p /etc
cp ${PKG_DATA}/com.atv.mysql.my.cnf ${PKG_DEST}/etc

cp -r ${PKG_WORK}/* ${PKG_DEST}/usr
