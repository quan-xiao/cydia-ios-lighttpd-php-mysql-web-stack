pkg:setup
autoconf-2.69
pkg:configure ac_cv_file___dev_urandom_=yes --enable-ipv6 
pkg:make
pkg:install
