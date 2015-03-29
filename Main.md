01/2015<br>
<br>
<br>
<h1>Add Cydia Repo Source</h1>
You will find more information about the repo here: <b><a href='http://ios-webstack.tk/cydia'>http://ios-webstack.tk/cydia</a></b>
<br>
You can download the packages separately  here: <a href='http://ios-webstack.tk/deb_files'>http://ios-webstack.tk/deb_files</a>

You can add the repo in Cydia, NitoTV or direct with following command:<br>
<pre><code>echo 'deb http://ios-webstack.tk/cydia/ ./' &gt; /etc/apt/sources.list.d/ios-webstack.list<br>
</code></pre>
For your security I advice you to add the PGP public key of the iOS WebStack Cydia repo. (<a href='http://www.ios-webstack.tk/public-key'>How to</a>)<br>
<br>
<br>

<h1>Introduction</h1>
<h2>Why</h2>
The main task of this project was an iOS implementation of a web server with PHP and MySQL/SQLite3 support.<br>
<br>
<br>

<h2>Result</h2>
With the result of this project you will have the opportunity to run on an iPhone, an iPad, or on an AppleTV different Content Management Systems (CMS), Blogs, Bulletin Boards, File Server such as ownCloud, WebsiteBaker, Contao, TYPO3, WordPress, GetSimple, DokuWiki, Joomla!, phpBB, miniBB, etc.<br>
<br>

This project will produces a lot of .deb packages (Cydia Repo here: <b><a href='http://ios-webstack.tk/cydia'>http://ios-webstack.tk/cydia</a></b>) but three of them are the main setup packages:<br>
<br>
<ul><li>On an AppleTV, the package <b>'<a href='AtvLighttpdPhpMysql.md'>atv-lighttpd-php-mysql</a>'</b> will setup a whole web stack solution with newest iOS WebStack parts.<br>
</li><li>On an iPad/iPhone/iPod, the package <b>'<a href='IosLighttpdPhpMysql.md'>ios-lighttpd-php-mysql</a>'</b> will setup a whole web stack solution with newest iOS WebStack parts.<br>
</li><li>On an iPad/iPhone/iPod, the package <b>'<a href='TouchLighttpdPhpMysql.md'>touch-lighttpd-php-mysql</a>'</b> will setup a whole web stack solution with older and therefore unsafe parts from Saurik's major repo.</li></ul>

<h2>Result Package dependencies</h2>
<table><thead><th> </th><th> <b>atv-lighttpd-php-mysql</b><br>1.4</th><th> <b>ios-lighttpd-php-mysql</b><br>2.2</th><th> <b>touch-lighttpd-php-mysql</b><br>2.8</th></thead><tbody>
<tr><td> <b>Lighttpd</b> </td><td> 1.4.35 </td><td> 1.4.35 </td><td> 1.4.18<b><sup>*</sup></b> </td></tr>
<tr><td> <b>PHP</b> </td><td> 5.4.38 </td><td> 5.4.38 </td><td> 5.3.29 </td></tr>
<tr><td> <b>MySQL</b> </td><td> 5.1.71 </td><td> 5.1.71 </td><td> 5.0.96<b><sup>*</sup></b> </td></tr>
<tr><td> <b>OpenSSL</b> </td><td> 0.9.8.zd </td><td> 0.9.8.zd </td><td> 0.9.8.zc<b><sup>*</sup></b> </td></tr>
<tr><td> <b>libjpeg</b> </td><td> 8d </td><td> 8d </td><td> 6b<b><sup>*</sup></b> </td></tr>
<tr><td> <b>libpng</b> </td><td> 1.2.50 </td><td> 1.2.50 </td><td> 1.2.24<b><sup>*</sup></b> </td></tr>
<tr><td> <b>libtiff</b> </td><td> 4.0.3 </td><td> 4.0.3 </td><td> 3.8.2<b><sup>*</sup></b> </td></tr>
<tr><td> <b>libfreetype</b> </td><td> 2.4.11 </td><td> 2.14.11 </td><td> 2.4.11 </td></tr>
<tr><td> <b>libmcrypt</b> </td><td> 2.5.8 </td><td> 2.5.8 </td><td> -- </td></tr></tbody></table>

<b><sup>*</sup></b>apt.saurik.com or apt.thebigboss.org repo<br>
<sup>(01/2015)</sup><br>
<br>

<h1>User Information</h1>
<h2>lighttpd-php-mysql Packages</h2>
<b><a href='AtvLighttpdPhpMysql.md'>atv-lighttpd-php-mysql</a></b>

<b><a href='IosLighttpdPhpMysql.md'>ios-lighttpd-php-mysql</a></b>

<b><a href='TouchLighttpdPhpMysql.md'>touch-lighttpd-php-mysql</a></b>

<br>
<h2>CMS Packages</h2>
<b><a href='WebContent.md'>List of Web Content Management Systems</a></b>

<br>
<h2>PHP 5.5.x / 5.4.x / 5.3.x</h2>
<b><a href='PHP.md'>PHP</a></b>

<br>
<h2>MySQL 5.1.71</h2>
<b><a href='MySQL.md'>MySQL</a></b>

<br>
<h2>Lighttpd 1.4.35</h2>
<b><a href='Lighttpd.md'>Lighttpd</a></b>

<br>
<h2>Tools</h2>
<b><a href='Tools.md'>Dovecot, mpop, msmtp, isync, Webalizer, Logrotate, E-MailRelay</a></b>

<br>
<b><a href='Cron.md'>Simple Cron Job Simulation</a></b>


<br>
<h1>Developer Information</h1>
The base of this project is the SVN telesphoreo trunk <a href='http://svn.telesphoreo.org/trunk/data/'>http://svn.telesphoreo.org/trunk/data/</a> .<br>
Without that telesphoreo trunk and without an iOS SDK you can't compile this project packages!<br>
<h2>iOS Cross Compiler</h2>
<b><a href='CrossCompiler.md'>Install an iOS Cross Compiler Suite</a></b>
<br>
<h2>Note</h2>
All distributed executable of this project are linked against the iOS SDK 2.0 or 3.0.<br>
<br>
<br>
<h1>Credits</h1>
All information from the following websites have helped me to develop this project:<br>
<ul><li><a href='http://technoids.com:8080'>Technoids</a>
</li><li><a href='http://imho.nu'>imho.nu</a>
</li><li><a href='http://was.fm'>was.fm</a>