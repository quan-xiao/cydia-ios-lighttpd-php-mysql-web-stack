pkg:setup
autoconf-2.69

pkg:configure --with-random=/dev/random --enable-ipv6 --with-openssl --with-ca-path=/etc/ssl/certs
make test

pkg:install

#logrotate config files
mkdir -p ${PKG_DEST}/etc/logrotate.d
cp ${PKG_DATA}/logrotate_curl ${PKG_DEST}/etc/logrotate.d/curl
