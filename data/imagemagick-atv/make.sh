echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

export CPPFLAGS="-I$(PKG_DEST_ _libfreetype)/usr/include/freetype2 -I$(PKG_DEST_ libxml2)/usr/include/libxml2"

export PATH=$PATH:"$(PKG_DEST_ libxml2)"/usr/bin

pkg:configure ac_cv_path_xml2_config="$(PKG_DEST_ libxml2)"/usr/bin/xml2-config --disable-largefile --with-quantum-depth=8

pkg:make

pkg:install



