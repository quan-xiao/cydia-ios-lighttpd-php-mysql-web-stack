http://code.google.com/p/cydia-ios-lighttpd-php-mysql-web-stack/wiki/Main

Before you can compile telesphoreo packages, you have to export something:

export WHERE_IS_IOS_TOOLCHAIN=/home/mobile/toolchain/toolchain
export WHERE_IS_TELESPHOREO_TRUNK=/home/mobile/telesphoreo
export PATH=${PATH}:${WHERE_IS_IOS_TOOLCHAIN}/pre/bin
export SYSROOT=${WHERE_IS_IOS_TOOLCHAIN}/sys
export PKG_BASE=${WHERE_IS_TELESPHOREO_TRUNK}
export PKG_ARCH=iphoneos-arm
export PKG_CONFIG_PATH=${SYSROOT}/usr/lib/pkgconfig

