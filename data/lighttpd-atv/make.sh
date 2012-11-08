echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

autoconf-2.69

export XML_LIBS="-L"${PKG_ROOT}"/usr/lib -lxml2"
export XML_CFLAGS=-I"${PKG_ROOT}"/usr/include/libxml2
export SQLITE_LIBS="-L"${PKG_ROOT}"/usr/lib -lsqlite3"
export SQLITE_CFLAGS=-I"${PKG_ROOT}"/usr/include
export PCRE_LIB="-L"$(PKG_DEST_ pcre)"/usr/lib -lpcre"
export CPPFLAGS=-I"$(PKG_DEST_ pcre)"/usr/include/pcre
export WITH_OPENSSL="$(PKG_DEST_ openssl)"
export UUID_LIBS="-L"$(PKG_DEST_ uuid)/usr/lib" -luuid"
pkg:configure   --libdir=/usr/lib/lighttpd --with-openssl --with-bzip2 --with-webdav-locks --with-webdav-props

export CFLAGS='-O2 -mthumb'
make

pkg:install


#We have some bad links in the libryry .la files
#It is better to delete them
rm "${PKG_DEST}"/usr/lib/lighttpd/*.la

