pkg:setup
CHOST="${PKG_TARG}" prefix=/usr ./configure 
pkg:make
make install prefix="${PKG_DEST}"/usr
