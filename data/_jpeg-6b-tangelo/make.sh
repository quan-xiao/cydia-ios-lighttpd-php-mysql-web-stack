echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

#It is just a copy of http://apt.saurik.com/debs/jpeg_6b-1_iphoneos-arm.deb

cp -ra * "${PKG_DEST}"
rm "${PKG_DEST}"/usr/lib/*.la
