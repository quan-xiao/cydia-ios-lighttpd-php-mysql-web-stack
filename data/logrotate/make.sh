echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup
export CC=arm-apple-darwin9-gcc
export POPT_DIR="$(PKG_DEST_ _libpopt)"/usr/local

make  

mkdir -p "${PKG_DEST}"/usr/local/sbin
mkdir -p "${PKG_DEST}"/etc
mkdir -p "${PKG_DEST}"/etc/logrotate.d
chmod 755 logrotate
cp logrotate "${PKG_DEST}"/usr/local/sbin 
cp "${PKG_DATA}"/logrotate.conf "${PKG_DEST}"/etc
