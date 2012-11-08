pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/include

cp -ra "$(PKG_DEST_ _libjpeg)"/usr/lib/!(*.dylib) "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libjpeg)"/usr/include/* "${PKG_DEST}"/usr/include
