pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/bin
cp -a "$(PKG_DEST_ _libjpeg)"/usr/lib/*.dylib "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libjpeg)"/usr/bin/* "${PKG_DEST}"/usr/bin
