pkg: mkdir -p /usr/local/lib
pkg: mkdir -p /usr/local/include
cp -ra "$(PKG_DEST_ _libgsasl)"/usr/local/lib/!(*.dylib) "${PKG_DEST}"/usr/local/lib
cp -ra "$(PKG_DEST_ _libgsasl)"/usr/local/include/* "${PKG_DEST}"/usr/local/include
