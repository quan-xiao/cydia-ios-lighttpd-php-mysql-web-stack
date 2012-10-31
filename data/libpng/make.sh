pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/bin
cp -r "$(PKG_DEST_ _libpng)"/usr/lib/*.dylib "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libpng)"/usr/bin/* "${PKG_DEST}"/usr/bin
