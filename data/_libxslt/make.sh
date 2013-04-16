echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"


pkg:setup

pkg:configure --with-xml --without-python --host=arm-apple-darwin9 --with-libxml-prefix="$(PKG_DEST_ _libxml2)"/usr --with-libxml-include-prefix="$(PKG_DEST_ _libxml2)"/usr/include/libxml2 --with-libxml-libs-prefix="$(PKG_DEST_ _libxml2)"/usr/lib
pkg:make
make install prefix="${PKG_DEST}"/usr datarootdir="${PKG_DEST}"/usr
