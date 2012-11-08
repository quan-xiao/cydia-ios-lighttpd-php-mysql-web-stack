pkg:setup

pkg:configure
export CFLAGS='-O2 -mthumb'
make
pkg:install
