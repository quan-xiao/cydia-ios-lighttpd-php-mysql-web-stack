echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup
mkdir -p ${PKG_DEST}/usr/local
cp -ra * ${PKG_DEST}/usr/local
#rm ${PKG_DEST}/usr/local/bin/pg_config
rm ${PKG_DEST}/usr/local/lib/libpq.dylib
ln -s ${PKG_DEST}/usr/local/lib/libpq.5.5.dylib ${PKG_DEST}/usr/local/lib/libpq.dylib
exit 
