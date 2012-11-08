pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/include
pkg: mkdir -p /usr/bin
cp -ra "$(PKG_DEST_ _libpng)"/usr/lib/!(*.dylib) "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libpng)"/usr/include/* "${PKG_DEST}"/usr/include
cp -ra "$(PKG_DEST_ _libpng)"/usr/bin/* "${PKG_DEST}"/usr/bin
