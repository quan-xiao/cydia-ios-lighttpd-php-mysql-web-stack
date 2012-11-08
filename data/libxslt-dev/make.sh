pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/bin
pkg: mkdir -p /usr/include
pkg: mkdir -p /usr/aclocal

cp -ra "$(PKG_DEST_ _libxslt)"/usr/lib/!(*.dylib) "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libxslt)"/usr/include/* "${PKG_DEST}"/usr/include


