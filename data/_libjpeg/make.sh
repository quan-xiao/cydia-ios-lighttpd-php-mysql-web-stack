pkg:setup
pkg:configure
pkg:make
make install-strip prefix="${PKG_DEST}"/usr datarootdir="${PKG_DEST}"/usr
