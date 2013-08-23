echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

export LDFLAGS=-L"$(PKG_DEST_ berkeleydb)"/usr/lib
export CFLAGS=-I"$(PKG_DEST_ berkeleydb)"/usr/include

pkg:configure --prefix=/usr/local --sysconfdir=/etc --with-ssl="$(PKG_DEST_ openssl)"/usr 
pkg:make  
pkg:install

