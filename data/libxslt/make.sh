pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/bin

cp -ra "$(PKG_DEST_ _libxslt)"/usr/lib/*.dylib "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libxslt)"/usr/bin/* "${PKG_DEST}"/usr/bin
