echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

export CPPFLAGS="-I$(PKG_DEST_ freetype2-atv)/usr/include/freetype2"

pkg:configure --disable-largefile --with-perl=no  --with-x=no LIBS=-lfreetype --with-freetype=yes
pkg:make
pkg:install
