pkg:setup
pkg:configure --with-libssl-prefix="$(PKG_DEST_ openssl)" --with-ssl=openssl
make
pkg:install
