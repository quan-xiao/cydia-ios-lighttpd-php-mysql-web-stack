echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup
#cp "${PKG_DATA}"/configure.ac .
autoconf 
#export CC="${PKG_TARG}"-gcc
export CFLAGS=-I"$(PKG_DEST_ _libpng)"/usr/include 
pkg:configure  --prefix=/usr/local --with-png="$(PKG_DEST_ _libpng)"/usr --with-jpeg="$(PKG_DEST_ _libjpeg)"/usr --with-freetype="$(PKG_DEST_ _libfreetype)"/usr
export CFLAGS='-mthumb'
make
pkg:install  
#make install

