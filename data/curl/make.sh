pkg:setup
autoconf-2.69

pkg:configure --with-random=/dev/urandom --enable-ipv6 --with-openssl --with-ca-path=/etc/ssl/certs
make test

pkg:install
