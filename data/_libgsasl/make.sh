echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup
pkg:configure --prefix=/usr/local --with-libntlm-prefix="$(PKG_DEST_ _libntlm)"/usr/local --with-libidn-prefix="$(PKG_DEST_ _libidn)"/usr/local --with-libgcrypt-prefix="$(PKG_DEST_ gcrypt)"/usr/local
pkg:make
pkg:install  

