pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/include

cp -ra "$(PKG_DEST_ _libtiff)"/usr/lib/!(*.dylib) "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libtiff)"/usr/include/* "${PKG_DEST}"/usr/include

