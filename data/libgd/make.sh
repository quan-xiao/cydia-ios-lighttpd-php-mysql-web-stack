pkg: mkdir -p /usr/local/lib
pkg: mkdir -p /usr/local/bin
cp -a "$(PKG_DEST_ _libgd)"/usr/local/lib/*.dylib "${PKG_DEST}"/usr/local/lib
cp -ra "$(PKG_DEST_ _libgd)"/usr/local/bin/* "${PKG_DEST}"/usr/local/bin
rm "${PKG_DEST}"/usr/local/bin/gdlib-config
