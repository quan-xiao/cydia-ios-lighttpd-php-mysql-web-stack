pkg:setup
pkg:configure --enable-nanorc --enable-utf8 --sysconfdir=/etc
make
pkg:install
pkg: mkdir -p /etc/profile.d
pkg: cp -a %/nano.sh /etc/profile.d
pkg: cp -a %/nanorc /etc
