echo PKG_ROOT = "${PKG_ROOT}"
echo PKG_WORK = "${PKG_WORK}"
echo PKG_DATA = "${PKG_DATA}"
echo PKG_DEST = "${PKG_DEST}"
echo PKG_TARG = "${PKG_TARG}"

pkg:setup
autoconf-2.69

export AR=$(which "${PKG_TARG}-ar") 
pkg:configure --sysconfdir=/etc  --with-lockfile=/dev/null --with-ldap=no --enable-cups=no --with-acls=no --with-bdb="$(PKG_DEST_ berkeleydb)/usr" --with-libgcrypt-dir="$(PKG_DEST_ gcrypt)/usr" --with-ssl-dir="$(PKG_DEST_ openssl)/usr" --with-cnid-cdb-backend=yes --with-cnid-default-backend=cdb --with-cnid-dbd-backend=no --with-cnid-last-backend=no --with-cnid-tdb-backend=no 

make
pkg:install



# Create daemon launcher files
pkg: mkdir -p /Library/LaunchDaemons
pkg: cp -a %/com.atv.netatalk.dns-sd.plist /Library/LaunchDaemons
pkg: cp -a %/com.atv.netatalk.afpd.plist /Library/LaunchDaemons

# Copy all config files
pkg: mkdir -p /etc
pkg: cp -a %/afp.conf /etc

# Remove unused config files
rm "${PKG_DEST}"/etc/dbus-session.conf
rm "${PKG_DEST}"/usr/share -R
rm "${PKG_DEST}"/usr/include -R
rm "${PKG_DEST}"/usr/lib/*.la
rm "${PKG_DEST}"/usr/lib/netatalk/*.la


# Netatalk will use some of its own gcrypt lib version. This will prevent library version conflicts.
# (So it does not really need all package dependencies... but I need the dependencies to compile the Netatalk package)
# Very bad hack....
# Just use specified libgcrypt and libgpg-error librarys

# 1) Copy specified libgcrypt and libgpg-error librarys to /usr/lib/netatalk
pkg: mkdir -p /usr/lib/netatalk
cp -a "$(PKG_DEST_ gcrypt)"/usr/lib/libgcrypt.11.dylib "${PKG_DEST}"/usr/lib/netatalk
cp -a "$(PKG_DEST_ libgpg-error)"/usr/lib/libgpg-error.0.dylib "${PKG_DEST}"/usr/lib/netatalk

# 2) change path information in binaries
arm-apple-darwin9-install_name_tool -change  /usr/lib/libgcrypt.11.dylib  /usr/lib/netatalk/libgcrypt.11.dylib "${PKG_DEST}"/usr/sbin/afpd
arm-apple-darwin9-install_name_tool -change  /usr/lib/libgpg-error.0.dylib  /usr/lib/netatalk/libgpg-error.0.dylib "${PKG_DEST}"/usr/sbin/afpd
arm-apple-darwin9-install_name_tool -change  /usr/lib/libgcrypt.11.dylib  /usr/lib/netatalk/libgcrypt.11.dylib "${PKG_DEST}"/usr/lib/netatalk/uams_dhx2_passwd.so
arm-apple-darwin9-install_name_tool -change  /usr/lib/libgpg-error.0.dylib  /usr/lib/netatalk/libgpg-error.0.dylib "${PKG_DEST}"/usr/lib/netatalk/uams_dhx2_passwd.so



