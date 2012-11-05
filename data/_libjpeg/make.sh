pkg:setup
pkg:configure
pkg:make
export CFLAGS='-O2 -mthumb'
make install prefix="${PKG_DEST}"/usr datarootdir="${PKG_DEST}"/usr
