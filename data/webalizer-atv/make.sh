echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

export LDFLAGS="-L"$(PKG_DEST_ _libgd)"/usr/local/lib -L"$(PKG_DEST_ _libpng)"/usr/lib -L"$(PKG_DEST_ _libjpeg)"/usr/lib -L"$(PKG_DEST_ berkeleydb)"/usr/lib -L"$(PKG_DEST_ _libgeoip)"/usr/local/lib"
pkg:configure --prefix=/usr/local --with-geodb=/usr/local/share/GeoDB/ --enable-bz2 ac_cv_lib_bz2_main --sysconfdir=/etc --enable-dns ac_cv_lib_z_main=yes ac_cv_lib_png_main=yes ac_cv_lib_z_gzrewind=yes --with-png="$(PKG_DEST_ _libpng)"/usr/include --enable-geoip --with-geoip="$(PKG_DEST_ _libgeoip)"/usr/local/include --with-gd="$(PKG_DEST_ _libgd)"/usr/local/include ac_cv_lib_gd_main=yes ac_cv_lib_gd_gdImagePng=yes --with-db="$(PKG_DEST_ berkeleydb)"/usr/include
make  
pkg:install
rm "${PKG_DEST}"/etc/webalizer.conf.sample 
cp "${PKG_DATA}"/webalizer.conf "${PKG_DEST}"/etc/webalizer.conf

mkdir -p "${PKG_DEST}"/var/www/webalizer
mkdir -p "${PKG_DEST}"/usr/local/share/GeoDB
cp "${PKG_DATA}"/tk.webstack.ios.index.html "${PKG_DEST}"/var/www/webalizer
cp "${PKG_DATA}"/GeoDB.dat "${PKG_DEST}"/usr/local/share/GeoDB
