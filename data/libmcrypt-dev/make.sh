pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/include
pkg: mkdir -p /usr/share

cp -ra "$(PKG_DEST_ _libmcrypt)"/usr/lib/!(*.dylib) "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libmcrypt)"/usr/include/* "${PKG_DEST}"/usr/include
cp -ra "$(PKG_DEST_ _libmcrypt)"/usr/share/* "${PKG_DEST}"/usr/share

