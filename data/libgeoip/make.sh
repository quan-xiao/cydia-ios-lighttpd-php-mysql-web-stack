pkg: mkdir -p /usr/lib
pkg: mkdir -p /usr/bin
pkg: mkdir -p /etc
pkg: mkdir -p /usr/share
cp -a "$(PKG_DEST_ _libgeoip)"/usr/lib/*.dylib "${PKG_DEST}"/usr/lib
cp -ra "$(PKG_DEST_ _libgeoip)"/usr/bin/* "${PKG_DEST}"/usr/bin
cp -ra "$(PKG_DEST_ _libgeoip)"/usr/share/* "${PKG_DEST}"/usr/share
cp  "${PKG_DATA}"/GeoIP.conf "${PKG_DEST}"/etc
