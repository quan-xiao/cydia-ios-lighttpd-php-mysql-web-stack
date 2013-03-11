pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/include
pkg: mkdir -p /usr/bin
cp -ra "$(PKG_DEST_ _libgd)"/usr/lib/!(*.dylib) "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libgd)"/usr/include/* "${PKG_DEST}"/usr/include
cp -ra "$(PKG_DEST_ _libgd)"/usr/bin/gdlib-config "${PKG_DEST}"/usr/bin
