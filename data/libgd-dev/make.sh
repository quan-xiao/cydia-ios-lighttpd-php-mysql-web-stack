pkg: mkdir -p /usr/local/lib
pkg: mkdir -p /usr/local/include
pkg: mkdir -p /usr/local/bin
cp -ra "$(PKG_DEST_ _libgd)"/usr/local/lib/!(*.dylib) "${PKG_DEST}"/usr/local/lib
cp -ra "$(PKG_DEST_ _libgd)"/usr/local/include/* "${PKG_DEST}"/usr/local/include
cp -ra "$(PKG_DEST_ _libgd)"/usr/local/bin/gdlib-config "${PKG_DEST}"/usr/local/bin
