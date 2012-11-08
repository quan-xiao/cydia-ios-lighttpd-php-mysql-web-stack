http://code.google.com/p/cydia-ios-lighttpd-php-mysql-web-stack/wiki/Main

Before you can compile telesphoreo packages, you have to export something:

export WHEREIS_YOUR_IOS_TOOLCHAIN=/home/mobile/Projects/iphone/toolchain/toolchain
export WHEREIS_TELESPHOREO_TRUNK=/home/mobile/test/telesphoreo
export PATH=$PATH:$WHEREIS_YOUR_IOS_TOOLCHAIN/pre/bin
export SYSROOT=$WHEREIS_YOUR_IOS_TOOLCHAIN/sys/
export PKG_BASE=$WHEREIS_TELESPHOREO_TRUNK
export PKG_ARCH=iphoneos-arm
export PKG_CONFIG_PATH=$SYSROOT/usr/lib/pkgconfig/
