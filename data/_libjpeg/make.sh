pkg:setup
pkg:configure
pkg:make
make install prefix="${PKG_DEST}"/usr datarootdir="${PKG_DEST}"/usr
