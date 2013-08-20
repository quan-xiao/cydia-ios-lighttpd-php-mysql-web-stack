pkg:setup
pkg:autoconf-2.69
pkg:configure --disable-endian-check --with-gpg-error-prefix="$(PKG_DEST_ libgpg-error)/usr"
make
pkg:install
