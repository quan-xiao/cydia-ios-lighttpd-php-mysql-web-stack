pkg: mkdir -p /usr/local/lib
pkg: mkdir -p /usr/local/bin
pkg: mkdir -p /etc
pkg: mkdir -p /usr/local/share
cp -a "$(PKG_DEST_ _libgeoip)"/usr/local/lib/*.dylib "${PKG_DEST}"/usr/local/lib
cp -ra "$(PKG_DEST_ _libgeoip)"/usr/local/bin/* "${PKG_DEST}"/usr/local/bin
cp -ra "$(PKG_DEST_ _libgeoip)"/usr/local/share/* "${PKG_DEST}"/usr/local/share
cp -ra "$(PKG_DEST_ _libgeoip)"/etc/* "${PKG_DEST}"/etc

cp "${PKG_DATA}"/geoipupdt.sh "${PKG_DEST}"/usr/local/bin
