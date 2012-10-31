pkg: mkdir -p /usr/bin
pkg: mkdir -p /usr/lib
cp -ra "$(PKG_DEST_ _libmcrypt)"/usr/lib/*.dylib "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libmcrypt)"/usr/bin/* "${PKG_DEST}"/usr/bin
