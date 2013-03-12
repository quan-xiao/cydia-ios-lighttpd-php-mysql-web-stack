pkg: mkdir -p /usr/local/lib
pkg: mkdir -p /usr/local/include
cp -ra "$(PKG_DEST_ _libgeoip)"/usr/local/lib/!(*.dylib) "${PKG_DEST}"/usr/local/lib
cp -ra "$(PKG_DEST_ _libgeoip)"/usr/local/include/* "${PKG_DEST}"/usr/local/include
