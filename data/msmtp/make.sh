echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup
export LDFLAGS="-L"$(PKG_DEST_ openssl)"/usr/lib"

export libssl_CFLAGS=-I"$(PKG_DEST_ openssl)"/usr/include/openssl 
#export libssl_LIBS="-L"$(PKG_DEST_ openssl)"/usr/lib -lssl"

export libgsasl_CFLAGS=-I"$(PKG_DEST_ _libgsasl)"/usr/local/include
export libgsasl_LIBS="-L"$(PKG_DEST_ _libgsasl)"/usr/local/lib -lgsasl"

export libidn_CFLAGS=-I"$(PKG_DEST_ _libidn)"/usr/local/include
export libidn_LIBS="-L"$(PKG_DEST_ _libidn)"/usr/local/lib -lidn"

pkg:configure --prefix=/usr/local --sysconfdir=/etc
make  
pkg:install

rm -r "${PKG_DEST}"/usr/local/share/info
