echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup

export LDFLAGS="-L"$(PKG_DEST_ openssl)"/usr/lib"
export SSL_CFLAGS="-I"$(PKG_DEST_ openssl)"/usr/include/openssl"

pkg:autoconf-2.69

pkg:configure --prefix=/usr/local --sysconfdir=/etc --localstatedir=/var --with-openssl=yes --enable-mac 
# --enable-ipv6


pkg:make  
pkg:install 

rm -r "${PKG_DEST}"/etc

##Cross compiling config content patch for E-MailRelay
#cd "${PKG_DEST}"/etc
#sed -ie "s{spool-dir /home/mobile/telesphoreo/dest/iphoneos-arm/emailrelay/var/spool/emailrelay{spool-dir /var/spool/emailrelay{" emailrelay.conf
##Patch-End

mkdir -p ${PKG_DEST}/etc/logrotate.d
cp ${PKG_DATA}/emailrelay.logrotate ${PKG_DEST}/etc/logrotate.d/emailrelay
