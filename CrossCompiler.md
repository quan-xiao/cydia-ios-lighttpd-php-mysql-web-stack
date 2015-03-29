<sub> </sub>07/2013


<br>
<h1>With this Toolchain you don't will get an 'illegal instruction: 4' error</h1>
See <a href='http://iphonesdkdev.blogspot.de/2013/02/illegal-instruction-4.html'>http://iphonesdkdev.blogspot.de/2013/02/illegal-instruction-4.html</a>
<br>
<br>
<br>
<h1>Introduction</h1>

With this installation instruction you will get a Toolchain to compile <a href='http://svn.telesphoreo.org/trunk/data/'>Saurik's Telesphoreo packages</a> for iOS devices.<br>
<br>
If you obey this instruction <b>exactly</b>, you will get a well working iOS SDK 3.0 GNU Cross Compiling Toolchain.<br>
<br>
I will not support you by mail.<br>
Therefore: <b>Do it exactly as described!</b>

<br>
<h1>What you get</h1>
<ul><li>A GNU Cross Compiler Suite 4.2.1 for iOS ARM Processors<br>
</li><li>A iOS SDK 3.0 development enviroment<br>
</li><li>A whole Toolchain to compile Telesphoreo or your own iOS device packages</li></ul>

<br>
<h1>What you need</h1>
<ul><li>A Ubuntu Server <b>8.04.4</b> LTS (Hardy Heron) with internet connection -> <a href='http://releases.ubuntu.com/8.04/ubuntu-8.04.4-server-i386.iso'>ubuntu-8.04.4-server-i386.iso</a> (600MB)<br>
</li><li><b>It must be Ubuntu 8.04.4</b>. Because other Linux versions does not have the needed old build tool versions for the telesphoreo build chain. Other and newer Linux version will just exasperate you!<br>
</li><li>A .dmg file of XCode with iOS SDK 3.x -> for example <a href='http://developer.apple.com/ios/download.action?path=/iphone/iphone_sdk_3.1.3__final/iphone_sdk_3.1.3_with_xcode_3.1.4__leopard__9m2809a.dmg'>iphone_sdk_3.1.3_with_xcode_3.1.4__leopard__9m2809a.dmg</a> (3.1GB) (for that you need an Apple ID)<br>
</li><li>About two hours (it depends on your host system speed and your internet link speed)</li></ul>

<br>
<br>
<h1>iOS SDK 3.0 Installation Step by Step</h1>

<h2>Host Ubuntu Server</h2>
<ul><li>You have to install Ubuntu Server <b>8.04.4</b> on a real or on a virtual machine.<br>
</li><li>If you use a virtual machine, you will need a 16GB hard drive.<br>
</li><li>If you are asked for the root user name during the Ubuntu installation, you <b>must</b> specify '<b>mobile</b>'. (I will work with absolute pathes to your home folder)<br>
</li><li>Choose a password of your choice.<br>
</li><li>During the Ubuntu installation you have to activate '<b>OpenSSH Server</b>'.<br>
<br>
<h2>Ubuntu 8.04.4 is no longer supported</h2>
Since Ubuntu 8.04 is no longer supported, the original repositories no longer work.<br>
So you have to change the links in /etc/apt/sources.list or you can use following content for /etc/apt/sources.list:<br>
<pre><code><br>
deb http://old-releases.ubuntu.com/ubuntu/ hardy main restricted<br>
deb-src http://old-releases.ubuntu.com/ubuntu/ hardy main restricted<br>
deb http://old-releases.ubuntu.com/ubuntu/ hardy-updates main restricted<br>
deb-src http://old-releases.ubuntu.com/ubuntu/ hardy-updates main restricted<br>
deb http://old-releases.ubuntu.com/ubuntu/ hardy universe<br>
deb-src http://old-releases.ubuntu.com/ubuntu/ hardy universe<br>
deb http://old-releases.ubuntu.com/ubuntu/ hardy-updates universe<br>
deb-src http://old-releases.ubuntu.com/ubuntu/ hardy-updates universe<br>
deb http://old-releases.ubuntu.com/ubuntu/ hardy multiverse<br>
deb-src http://old-releases.ubuntu.com/ubuntu/ hardy multiverse<br>
deb http://old-releases.ubuntu.com/ubuntu/ hardy-updates multiverse<br>
deb-src http://old-releases.ubuntu.com/ubuntu/ hardy-updates multiverse<br>
deb http://old-releases.ubuntu.com/ubuntu hardy-security main restricted<br>
deb-src http://old-releases.ubuntu.com/ubuntu hardy-security main restricted<br>
deb http://old-releases.ubuntu.com/ubuntu hardy-security universe<br>
deb-src http://old-releases.ubuntu.com/ubuntu hardy-security universe<br>
deb http://old-releases.ubuntu.com/ubuntu hardy-security multiverse<br>
deb-src http://old-releases.ubuntu.com/ubuntu hardy-security multiverse<br>
#deb http://ppa.launchpad.net/python-dev/ppa/ubuntu hardy main<br>
</code></pre></li></ul>

<br>
<h2>Install the Host Tools</h2>
<ul><li>Login in your Ubuntu server.<br>
</li><li>Now you have to update your Ubuntu system and you have to install more needed tools:<br>
<pre><code><br>
sudo apt-get update<br>
sudo apt-get upgrade<br>
sudo apt-get install fakeroot realpath automake bison cpio flex g++ gawk gcc git-core gobjc patch gzip make mount subversion sudo tar unzip uuid uuid-dev wget xar mercurial libxml2-dev pkg-config libbz2-dev libcurl4-openssl-dev libssl-dev zlib1g-dev libssl-dev libpcre3-dev gettext-kde gperf debianutils libglib2.0-dev xmlto<br>
</code></pre></li></ul>

Now your host system is prepared.<br>
<br>
<br>
<h2>Prepare 'iphonedevonlinux'</h2>

The following procedure is based on <a href='https://code.google.com/p/iphonedevonlinux/'>iphonedevonlinux</a>. It will provide the iOS SDK.<br>
<br>
<ul><li>First you have to download the basis of iphonedevonlinux.<br>
<pre><code><br>
cd ~/<br>
mkdir ~/toolchain<br>
mkdir -p ~/toolchain/files/firmware<br>
cd ~/toolchain<br>
svn checkout http://iphonedevonlinux.googlecode.com/svn/branches/3.0 ./<br>
</code></pre></li></ul>

The iphonedevonlinux setup script will install a iOS SDK 3.0 toolchain on your host system. It will use your already downloaded XCode 3.x DMG file <a href='http://developer.apple.com/ios/download.action?path=/iphone/iphone_sdk_3.1.3__final/iphone_sdk_3.1.3_with_xcode_3.1.4__leopard__9m2809a.dmg'>iphone_sdk_3.1.3_with_xcode_3.1.4__leopard__9m2809a.dmg</a> .<br>
<br>
<ul><li>Please copy or move your XCode DMG file to <b>~/toolchain/toolchain/files/</b></li></ul>

The script expect the final XCode iOS SDK 3.0 file <b>but</b> all XCode iOS SDKs includes all iOS SDK versions down to Version 2.0 .<br>
You just have to know the path inside the DMG file. And we know it ;-)<br>
That are the reason why you can use/work with all XCode iOS SDK 3.x files.<br>
<br>
Furthermore the script will automaticly download a corresponding iOS device firmware file. It <b>must</b> be the file <a href='http://appldnld.apple.com.edgesuite.net/content.info.apple.com/iPhone/061-6578.20090617.VfgtU/iPhone1,2_3.0_7A341_Restore.ipsw'>iPhone1,2_3.0_7A341_Restore.ipsw</a> .<br>
<br>
<ul><li>If you want you can download the above mentioned firmware by yourself. Then <b>you have to</b> store it at <b>~/toolchain/toolchain/files/firmware/</b></li></ul>

The iphonedevonlinux setup script try to collect a iOS Firmware VFDecrypt Key from a none existing site from theiphonewiki.com . This means you have to place it by hand. But step by step...<br>
<br>
Before you can run the iphonedevonlinux setup script, you have to modified it <b>3 times</b>.<br>
<br>
<ul><li>1. <b>Find</b> in ~/toolchain/toolchain.sh<br>
<pre><code><br>
echo "I'm going to try to fetch it from $IPHONEWIKI_KEY_URL...."<br>
<br>
DECRYPTION_KEY_SYSTEM=$( wget --quiet -O - $IPHONEWIKI_KEY_URL | awk '\<br>
BEGIN { IGNORECASE = 1; }<br>
/name="3.0_.28Build_7A341.29"/               { found_3_0 = 1;   }<br>
/name="Root_Filesystem"/ &amp;&amp; found_3_0        { found_root = 1;  }<br>
/title="'${HW_BOARD_CONFIG}'"/ &amp;&amp; found_root { found_phone = 1; }<br>
/.*&lt;pre&gt;.*$/ &amp;&amp; found_phone {<br>
sub(/.*&lt;pre&gt;/,"", $0);<br>
print toupper($0); exit; }<br>
')<br>
<br>
if [ ! "$DECRYPTION_KEY_SYSTEM" ] ; then<br>
error "Sorry, no decryption key for system partition found!"<br>
exit 1<br>
fi<br>
echo "I found it!"<br>
fi<br>
</code></pre>
and <b>change it</b> to<br>
<pre><code><br>
echo "I'm going to try to fetch it from $IPHONEWIKI_KEY_URL...."<br>
<br>
DECRYPTION_KEY_SYSTEM=8d5d1fea02d627c9e9b0d994c3cfdeaab9780c86ac908db15461efe44eddd19f8924b6b2<br>
<br>
if [ ! "$DECRYPTION_KEY_SYSTEM" ] ; then<br>
error "Sorry, no decryption key for system partition found!"<br>
exit 1<br>
fi<br>
echo "I found it!"<br>
fi<br>
</code></pre>
<br>
</li><li>2. <b>Find</b> in ~/toolchain/toolchain.sh<br>
<pre><code><br>
# Check which PACKAGE we have to extract. Apple does have different<br>
# namings for it, depending on the SDK version.<br>
if [ "${TOOLCHAIN_VERSION}" == "3.0" ] ; then<br>
PACKAGE="iPhoneSDKHeadersAndLibs.pkg"<br>
elif [[ "`vercmp $SDK_VERSION $TOOLCHAIN_VERSION`" == "newer" ]]; then<br>
PACKAGE="iPhoneSDKecho $TOOLCHAIN_VERSION | sed 's/\./_/g' .p$<br>
else<br>
PACKAGE="iPhoneSDKHeadersAndLibs.pkg"<br>
fi<br>
</code></pre>
and <b>change it</b> to<br>
<pre><code><br>
# Check which PACKAGE we have to extract. Apple does have different<br>
# namings for it, depending on the SDK version.<br>
<br>
if [[ "`vercmp $SDK_VERSION $TOOLCHAIN_VERSION`" == "newer" ]]; then<br>
PACKAGE="iPhoneSDKecho $TOOLCHAIN_VERSION | sed 's/\./_/g' .p$<br>
else<br>
PACKAGE="iPhoneSDKHeadersAndLibs.pkg"<br>
fi<br>
</code></pre>
<br>
</li><li>3. <b>Find</b> in ~/toolchain/toolchain.sh<br>
<pre><code><br>
else<br>
svn co http://iphone-dev.googlecode.com/svn/trunk/csu .<br>
fi<br>
<br>
cp -R -p *.o "$SYS_DIR/usr/lib"<br>
</code></pre>
and <b>change it</b> to prevent the dreaded 'illegal instruction: 4' error to<br>
<pre><code><br>
else<br>
svn co http://iphone-dev.googlecode.com/svn/trunk/csu .<br>
fi<br>
<br>
cd "${SDKS_DIR}/iPhoneOS${TOOLCHAIN_VERSION}.sdk/usr/lib"<br>
<br>
cp -R -p *.o "$SYS_DIR/usr/lib"<br>
</code></pre></li></ul>

<br>
<h2>Build the iOS SDK 3.0 and the iOS Cross Compiler Tool Chain</h2>
<ul><li>Start the build script 'toolchain.sh' (it takes 10-20 minutes)<br>
<pre><code><br>
cd ~/toolchain<br>
sudo ./toolchain.sh all<br>
cd ~/toolchain<br>
sudo chown mobile:mobile * -R<br>
</code></pre></li></ul>

<ul><li>Add a bad and dark hack for code who needs g++ support. (Do not ask me why, but you will need it! I hope it will create correct binaries.)<br>
<pre><code><br>
cd ~/toolchain/toolchain/sys/usr/include/c++/4.2.1<br>
cp -ar armv6-apple-darwin9/bits/* ./bits/<br>
</code></pre></li></ul>

<ul><li>After you export the environment variables below, you have a working iOS Cross Compiling System with iOS SDK 3.0.<br>
Remember: If you are new login in your system you have to export the enviroment variables again!<br>
<pre><code><br>
export WHERE_IS_IOS_TOOLCHAIN=/home/mobile/toolchain/toolchain<br>
export WHERE_IS_TELESPHOREO_TRUNK=/home/mobile/telesphoreo<br>
export PATH=${PATH}:${WHERE_IS_IOS_TOOLCHAIN}/pre/bin<br>
export SYSROOT=${WHERE_IS_IOS_TOOLCHAIN}/sys<br>
export PKG_BASE=${WHERE_IS_TELESPHOREO_TRUNK}<br>
export PKG_ARCH=iphoneos-arm<br>
export PKG_CONFIG_PATH=${SYSROOT}/usr/lib/pkgconfig<br>
</code></pre></li></ul>

<ul><li>Test your Cross Compiler<br>
Now you will find all Cross Compiler Bin-Tools at <b>/home/mobile/toolchain/toolchain/pre/bin</b></li></ul>

Please try this one:<br>
<pre><code><br>
cd ~/<br>
echo 'int main(void) { printf("Hello World!\n"); }' &gt; test.c; arm-apple-darwin9-gcc test.c -o test; rm ./test.c;<br>
</code></pre>

If you transfer the test programm to your iOS device, it will not run. You have to sign it with '<a href='http://www.saurik.com/id/8'>ldid -S test</a>'. But step by step...<br>
<br>
<br>
<h2>Get Telesphoreo</h2>

<ul><li>You have to get telesphoreo via SVN  (it takes a long time)<br>
<pre><code><br>
cd ~/<br>
svn co http://svn.telesphoreo.org/trunk ./telesphoreo<br>
</code></pre>
and add missing stuff<br>
<pre><code><br>
cd ~/telesphoreo<br>
mkdir debs<br>
mkdir work<br>
mkdir stat<br>
echo '#!/bin/bash' &gt; upload.sh<br>
chmod +x upload.sh<br>
</code></pre></li></ul>

Done? <b>Not yet!</b>

<br>
<h2>Touch up Telesphoreo (1)</h2>
<ul><li>I don't know why, but you have to update the ldid sources from Telesphoreo. Superb, you already have the right one...<br>
<pre><code><br>
cd ~/<br>
tar xfvz ~/telesphoreo/data/ldid/ldid-1.0.610.tgz<br>
cp ldid-1.0.610/util/* /home/mobile/telesphoreo/util/<br>
cp -r ldid-1.0.610/minimal /home/mobile/telesphoreo/util/minimal/<br>
cd ~/<br>
rm -r ~/ldid-1.0.610<br>
</code></pre></li></ul>

<ul><li>In some scripts, telesphoreo use absolute pathes from saurik's home folder. So you have to create a user 'saurik' on your system and create a symlink to bypass the absolute pathes.<br>
<pre><code><br>
sudo adduser saurik<br>
sudo mkdir /home/saurik/iphone<br>
cd /home/saurik/iphone<br>
sudo ln -s /home/mobile/toolchain/sys sysroot<br>
</code></pre></li></ul>

Done? <b>No! Only 99% complete!</b>

<ul><li>Test the toolchain and Telesphoreo with following commands:<br>
<pre><code><br>
cd ~/telesphoreo<br>
./make.sh gzip<br>
</code></pre></li></ul>

Really finished? <b>Not Really!</b>

<br>
<h2>Touch up Telesphoreo (2)</h2>
<ul><li>The (old) Telesphoreo's packages will work well with the Ubuntu 'autoconf' version 2.61. But newer Open Source Software needs a newer one. So you have to install it parallel to the older one. The new auto tools will get the suffix '-2.69' :<br>
<pre><code><br>
cd ~/<br>
wget ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz<br>
tar xvfz autoconf-2.69.tar.gz<br>
cd autoconf-2.69<br>
./configure --program-suffix=-2.69<br>
make<br>
sudo make install<br>
</code></pre></li></ul>

<ul><li>For my iOS WebStack PHP packages your Host System will need a actual version of 'tic'. So you have to install it:<br>
<pre><code><br>
cd ~/<br>
wget ftp.gnu.org/pub/gnu/ncurses/ncurses-5.9.tar.gz<br>
tar xvfz ncurses-5.9.tar.gz<br>
cd ncurses-5.9<br>
./configure<br>
make<br>
sudo make install<br>
</code></pre></li></ul>

<ul><li>For my iOS WebStack PHP packages your Host System will need a actual version of PHP. So you have to install it:<br>
<pre><code><br>
cd ~/<br>
wget de3.php.net/distributions/php-5.4.8.tar.gz<br>
tar xfvz php-5.4.8.tar.gz<br>
cd php-5.4.8<br>
./configure<br>
make<br>
sudo make install<br>
</code></pre></li></ul>

<ul><li>Finaly, if you want compile the original PHP packages you have adjust <b>~/telesphoreo/data/php/make.sh</b>
<pre><code><br>
make<br>
</code></pre>
<b>to following</b>
<pre><code><br>
make ZEND_EXTRA_LIBS='-lresolv'<br>
</code></pre></li></ul>

Done? <b>YES! 100%!</b>


<br>
<br>
<h1>Explore the new iOS Toolchain</h1>
<ul><li>To compile a package try: cd ~/telesphoreo; <b>./make.sh package_name</b>
</li><li>To recompile a package try: cd ~/telesphoreo; <b>./remake.sh package_name</b>
</li><li>to create a .deb package try: cd ~/telesphoreo; <b>./package.sh package_name</b>
</li><li>Be careful with the script clean.sh!!!!<br>
</li><li>Your binary architecture will be <b>iphoneos-arm</b>
</li><li>Telesphoreo will automatically sign the build binaries with '<a href='http://www.saurik.com/id/8'>ldid</a>'<br>
</li><li>You will find all mayor cydia packages in ~/telesphoreo/<b>data</b>
</li><li>To see what does <b>pkg:</b> means, have a look in <b>~/telesphoreo/make.sh</b>
</li><li>Find out the meaning of ${<b>PKG_ROOT</b>}, ${<b>PKG_WORK</b>}, ${<b>PKG_DATA</b>}, ${<b>PKG_DEST</b>} and ${<b>PKG_TARG</b>} ${........<br>
<br></li></ul>

Have fun!<br>
<br>
<br>
<br>
<br>
P.S.<br>
<br>
If you want to build a different SDK version than 3.0, then you have to adjust the <a href='https://code.google.com/p/iphonedevonlinux/'>iphonedevonlinux</a> ~/toolchain/toolchain.sh script.<br>
<br>
For that you will find <b>VFDecrypt Keys</b> <a href='http://theiphonewiki.com/wiki/index.php?title=VFDecrypt_Keys'>here</a>.