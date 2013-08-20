pkg:setup
pkg:configure --disable-endian-check --with-libcurl="$(PKG_DEST_ curl)"/usr/lib  --disable-card-support --with-included-regex
mkdir -p "${PKG_DEST}"/usr/local/share/info/dir
make
pkg:install
pkg: rm -f /usr/share/gnupg/{FAQ,faq.html}
