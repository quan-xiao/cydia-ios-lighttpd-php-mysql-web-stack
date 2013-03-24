pkg: mkdir -p /usr/local/lib
pkg: mkdir -p /usr/local/bin
pkg: mkdir -p /usr/local/share
cp -a "$(PKG_DEST_ _libidn)"/usr/local/lib/*.dylib "${PKG_DEST}"/usr/local/lib
cp -ra "$(PKG_DEST_ _libidn)"/usr/local/bin/* "${PKG_DEST}"/usr/local/bin
cp -ra "$(PKG_DEST_ _libidn)"/usr/local/share/* "${PKG_DEST}"/usr/local/share

