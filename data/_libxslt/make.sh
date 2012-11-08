pkg:setup

pkg:configure --with-xml --without-python --host=arm-apple-darwin9

pkg:make
make install prefix="${PKG_DEST}"/usr datarootdir="${PKG_DEST}"/usr

