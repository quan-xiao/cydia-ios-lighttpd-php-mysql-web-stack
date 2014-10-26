pkg:setup
pkg:configure
cp src/syscfg/lock-obj-pub.arm-apple-darwin.h src/syscfg/lock-obj-pub.darwin9.h
make
pkg:install
