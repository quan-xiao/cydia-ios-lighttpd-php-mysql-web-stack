pkg:setup

pkg:configure --host=arm-apple-darwin9 --disable-posix-threads ac_cv_func_malloc_0_nonnull=yes ac_cv_func_realloc_0_nonnull=yes
export CFLAGS='-O2 -mthumb'
make
pkg:install
