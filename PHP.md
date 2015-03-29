08/2014<br>
<br>
<br>
<br>
<h1>Introduction</h1>

With this project you can use PHP 5.3.x, PHP 5.4.x or PHP 5.5.x on your jailbroken iOS-Device (AppleTV, iPhone, iPad, iPod Touch).<br>
<br>
<br>
This <b>PHP versions</b> are support fast-cgi, pdo_mysql, mysql, mysqli, mysqlnd, pdo_sqlite, sqlite3, pdo_pgsql.so, pgsql.so, gd (gif, png, bmp, xbm, tiff, jpeg and FreeType2), mbstring, exif, dom, xml2, xmlreader, xmlwriter, xslt, json, pcre, phar, calendar, reflection, session, zlib, zip, bz2, mcrypt, openssl, soap, ftp, pcntl, sockets and OPcache.<br>
<br>
(OPcache only for PHP55).<br>
<br>

<h1>PHP Configuration</h1>
The packages does not include the configuration file <b>php.ini</b>.<br>
If you create the file <b>php.ini</b> you have to place it here: <b>/etc/</b><br>

Example of <b>/etc/php.ini</b>:<br>
<pre><code>;This is an 'EXAMPLE' PHP configuration file.<br>
<br>
;Be careful with the socket path<br>
mysql.default_socket     = /tmp/mysql.sock<br>
pdo_mysql.default_socket = /tmp/mysql.sock<br>
mysqli.default_socket    = /tmp/mysql.sock<br>
<br>
;Limits<br>
upload_max_filesize = 10M<br>
post_max_size = 10M<br>
<br>
;TimeZone<br>
;You should simply replace "UTC" with the desired timezone.<br>
;The full list of supported time zones is available here: http://www.php.net/manual/en/timezones.php<br>
date.timezone = "UTC"<br>
<br>
;Make sure you log all php errors to a log file.<br>
;Make sure that php and lighttpd have write permissions.<br>
log_errors=On<br>
error_log=/var/log/lighttpd/php_scripts_error.log<br>
<br>
;To restrict PHP information leakage disable expose_php.<br>
;Have a check befor and after: curl -I http://your.iOS-Web.server/yourPHPsite.php<br>
expose_php=Off<br>
<br>
;Please have a look at http://www.cyberciti.biz/tips/php-security-best-practices-tutorial.html<br>
</code></pre>
<br>

You can place additional <b>.ini</b> files in the following scan folder: <b>/etc/php.d/</b>. If you do that, please remember the extension loading<br>
order of INI files (alphabetically).<br>
The example file <b>/etc/php.d/load_all.ini</b> will load all available pluggable extensions:<br>
<pre><code>;Load all available pluggable extensions...<br>
extension=iconv.so<br>
extension=mbstring.so<br>
extension=curl.so<br>
<br>
;SQLite3<br>
;The loading order is important<br>
extension=sqlite3.so<br>
extension=pdo_sqlite.so<br>
<br>
;MySQL<br>
;The loading order is important<br>
extension=mysqlnd.so<br>
extension=mysqli.so<br>
extension=mysql.so<br>
extension=pdo_mysql.so<br>
<br>
;PostgreSQL<br>
;The loading order is important<br>
;extension=pgsql.so<br>
;extension=pdo_pgsql.so<br>
<br>
;Must be loaded after mbstring.so<br>
extension=exif.so<br>
<br>
extension=gd.so<br>
extension=zip.so<br>
extension=bz2.so<br>
extension=calendar.so<br>
extension=mcrypt.so<br>
extension=xsl.so<br>
extension=openssl.so<br>
<br>
extension=ftp.so<br>
extension=sockets.so<br>
extension=pcntl.so<br>
</code></pre>
<h2>OPcache Configuration (only for PHP55)</h2>
The example file /etc/php.d/load_opcache.ini will load the OPcache extensions:<br>
<pre><code>;Load the OPcache extension<br>
zend_extension=opcache.so<br>
<br>
<br>
;OPcache default configuration<br>
;For more information Please see https://github.com/zendtech/ZendOptimizerPlus<br>
opcache.enable=1<br>
<br>
<br>
;For Apple TV just 24MB shared memory for storing precompiled PHP code.<br>
;On other iOS device you can adjust it up to 64 MB<br>
opcache.memory_consumption=24<br>
<br>
opcache.interned_strings_buffer=8<br>
opcache.max_accelerated_files=4000<br>
opcache.revalidate_freq=60<br>
opcache.fast_shutdown=1<br>
opcache.enable_cli=1<br>
opcache.error_log="/var/log/lighttpd/opcache.log"<br>
<br>
</code></pre>

<br>
<h1>Compatibility Note</h1>
This packages <b>does not</b> have the same file structure as Sauriks older PHP.<br>
Therefore, you must remove Sauriks PHP before you can install PHP53, PHP54 or PHP55.<br>
<br>
<ul><li><b>PHP53</b> use Sauriks older unmaintained graphic librarys jpeg, png and tiff.<br>
</li><li><b>PHP54</b> and <b>PHP55</b> use the newest iOS-WebStack graphic librarys libjpeg, libpng and libtiff.<br>
<br>
<br>
<h1>Add Cydia Repo Source</h1>
You will find the PHP53/PHP54/PHP55 project package here:<br>
<b><a href='http://ios-webstack.tk/cydia'>http://ios-webstack.tk/cydia</a></b></li></ul>

You can add it in Cydia, NitoTV or direct with following command:<br>
<pre><code><br>
echo 'deb http://ios-webstack.tk/cydia/ ./' &gt; /etc/apt/sources.list.d/ios-webstack.list<br>
</code></pre>
For your security I advice you to add the PGP public key of the iOS WebStack Cydia repo. (<a href='http://www.ios-webstack.tk/public-key'>How to</a>)<br>
<br>
<br>

<h1>Example phpinfo();</h1>
<table cellpadding='3' width='600' border='1'>
<tr><td>
<h1>PHP Version 5.4.26</h1>
</td></tr>
<blockquote><table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>System </td>
<td>Darwin Apple-TV 13.0.0 Darwin Kernel Version 13.0.0:<br>
<blockquote>Sun Dec 16 19:58:12 PST 2012;<br>
root:xnu-2107.7.55~11/RELEASE_ARM_S5L8930X AppleTV2,1 </td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Build Date </td>
<td>Jun 12 2013 13:00:23 </td>
</blockquote></tr>
<tr>
<blockquote><td>Configure Command </td>
<td> './configure' </td>
</blockquote></tr>
<tr>
<blockquote><td>Server API </td>
<td>CGI/FastCGI </td>
</blockquote></tr>
<tr>
<blockquote><td>Virtual Directory Support </td>
<td>disabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Configuration File (php.ini) Path </td>
<td>/etc </td>
</blockquote></tr>
<tr>
<blockquote><td>Loaded Configuration File </td>
<td>/etc/php.ini </td>
</blockquote></tr>
<tr>
<blockquote><td>Scan this dir for additional .ini files </td>
<td>/etc/php.d </td>
</blockquote></tr>
<tr>
<blockquote><td>Additional .ini files parsed </td>
<td>/etc/php.d/load_all.ini </td>
</blockquote></tr>
<tr>
<blockquote><td>PHP API </td>
<td>20100412 </td>
</blockquote></tr>
<tr>
<blockquote><td>PHP Extension </td>
<td>20100525 </td>
</blockquote></tr>
<tr>
<blockquote><td>Zend Extension </td>
<td>220100525 </td>
</blockquote></tr>
<tr>
<blockquote><td>Zend Extension Build </td>
<td>API220100525,NTS </td>
</blockquote></tr>
<tr>
<blockquote><td>PHP Extension Build </td>
<td>API20100525,NTS </td>
</blockquote></tr>
<tr>
<blockquote><td>Debug Build </td>
<td>no </td>
</blockquote></tr>
<tr>
<blockquote><td>Thread Safety </td>
<td>disabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Zend Signal Handling </td>
<td>disabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Zend Memory Manager </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Zend Multibyte Support </td>
<td>provided by mbstring </td>
</blockquote></tr>
<tr>
<blockquote><td>IPv6 Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>DTrace Support </td>
<td>disabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Registered PHP Streams</td>
<td>compress.zlib, compress.bzip2, php, file, glob, data,<br>
<blockquote>http, ftp, zip, https, ftps, phar</td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Registered Stream Socket Transports</td>
<td>tcp, udp, unix, udg, ssl, sslv3, sslv2, tls</td>
</blockquote></tr>
<tr>
<blockquote><td>Registered Stream Filters</td>
<td>zlib.<b>, bzip2.</b>, string.rot13, string.toupper,<br>
<blockquote>string.tolower, string.strip_tags, convert.<b>, consumed, dechunk,<br>
convert.iconv.</b>, mcrypt.<b>, mdecrypt.</b></td>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>
<blockquote>This program makes use of the Zend Scripting Language Engine:<br />
Zend Engine v2.4.0, Copyright (c) 1998-2013 Zend Technologies</td>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<br>
<br>
<hr /><br>
<br>
<br>
<h1>Configuration</h1>
<h2><a>bz2</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>BZip2 Support </td>
<td>Enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Stream Wrapper support </td>
<td>compress.bzip2:// </td>
</blockquote></tr>
<tr>
<blockquote><td>Stream Filter support </td>
<td>bzip2.decompress, bzip2.compress </td>
</blockquote></tr>
<tr>
<blockquote><td>BZip2 Version </td>
<td>1.0.6, 6-Sept-2010 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>calendar</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Calendar support </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>cgi-fcgi</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>cgi.check_shebang_line</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>cgi.discard_path</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>cgi.fix_pathinfo</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>cgi.force_redirect</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>cgi.nph</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>cgi.redirect_status_env</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>cgi.rfc2616_headers</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>fastcgi.logging</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>Core</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>PHP Version </td>
<td>5.4.16 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>allow_url_fopen</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>allow_url_include</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>always_populate_raw_post_data</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>arg_separator.input</td>
<td>&amp;</td>
<td>&amp;</td>
</blockquote></tr>
<tr>
<blockquote><td>arg_separator.output</td>
<td>&amp;</td>
<td>&amp;</td>
</blockquote></tr>
<tr>
<blockquote><td>asp_tags</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>auto_append_file</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>auto_globals_jit</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>auto_prepend_file</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>browscap</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>default_charset</td>
<td>UTF-8</td>
<td>UTF-8</td>
</blockquote></tr>
<tr>
<blockquote><td>default_mimetype</td>
<td>text/html</td>
<td>text/html</td>
</blockquote></tr>
<tr>
<blockquote><td>disable_classes</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>disable_functions</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>display_errors</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>display_startup_errors</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>doc_root</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>docref_ext</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>docref_root</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>enable_dl</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>enable_post_data_reading</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>error_append_string</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>error_log</td>
<td>/var/log/lighttpd/php_scripts_error.log</td>
<td>/var/log/lighttpd/php_scripts_error.log</td>
</blockquote></tr>
<tr>
<blockquote><td>error_prepend_string</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>error_reporting</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>exit_on_timeout</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>expose_php</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>extension_dir</td>
<td>/usr/local/lib/php/extensions/no-debug-non-zts-20100525</td>
<td>/usr/local/lib/php/extensions/no-debug-non-zts-20100525</td>
</blockquote></tr>
<tr>
<blockquote><td>file_uploads</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>highlight.comment</td>
<td><font>#FF8000</font></td>
<td><font>#FF8000</font></td>
</blockquote></tr>
<tr>
<blockquote><td>highlight.default</td>
<td><font>#0000BB</font></td>
<td><font>#0000BB</font></td>
</blockquote></tr>
<tr>
<blockquote><td>highlight.html</td>
<td><font>#000000</font></td>
<td><font>#000000</font></td>
</blockquote></tr>
<tr>
<blockquote><td>highlight.keyword</td>
<td><font>#007700</font></td>
<td><font>#007700</font></td>
</blockquote></tr>
<tr>
<blockquote><td>highlight.string</td>
<td><font>#DD0000</font></td>
<td><font>#DD0000</font></td>
</blockquote></tr>
<tr>
<blockquote><td>html_errors</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>ignore_repeated_errors</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>ignore_repeated_source</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>ignore_user_abort</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>implicit_flush</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>include_path</td>
<td>.:</td>
<td>.:</td>
</blockquote></tr>
<tr>
<blockquote><td>log_errors</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>log_errors_max_len</td>
<td>1024</td>
<td>1024</td>
</blockquote></tr>
<tr>
<blockquote><td>mail.add_x_header</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>mail.force_extra_parameters</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mail.log</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>max_execution_time</td>
<td>30</td>
<td>30</td>
</blockquote></tr>
<tr>
<blockquote><td>max_file_uploads</td>
<td>20</td>
<td>20</td>
</blockquote></tr>
<tr>
<blockquote><td>max_input_nesting_level</td>
<td>64</td>
<td>64</td>
</blockquote></tr>
<tr>
<blockquote><td>max_input_time</td>
<td>-1</td>
<td>-1</td>
</blockquote></tr>
<tr>
<blockquote><td>max_input_vars</td>
<td>1000</td>
<td>1000</td>
</blockquote></tr>
<tr>
<blockquote><td>memory_limit</td>
<td>128M</td>
<td>128M</td>
</blockquote></tr>
<tr>
<blockquote><td>open_basedir</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>output_buffering</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>output_handler</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>post_max_size</td>
<td>10M</td>
<td>10M</td>
</blockquote></tr>
<tr>
<blockquote><td>precision</td>
<td>14</td>
<td>14</td>
</blockquote></tr>
<tr>
<blockquote><td>realpath_cache_size</td>
<td>16K</td>
<td>16K</td>
</blockquote></tr>
<tr>
<blockquote><td>realpath_cache_ttl</td>
<td>120</td>
<td>120</td>
</blockquote></tr>
<tr>
<blockquote><td>register_argc_argv</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>report_memleaks</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>report_zend_debug</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>request_order</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>sendmail_from</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>sendmail_path</td>
<td> -t -i </td>
<td> -t -i </td>
</blockquote></tr>
<tr>
<blockquote><td>serialize_precision</td>
<td>17</td>
<td>17</td>
</blockquote></tr>
<tr>
<blockquote><td>short_open_tag</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>SMTP</td>
<td>localhost</td>
<td>localhost</td>
</blockquote></tr>
<tr>
<blockquote><td>smtp_port</td>
<td>25</td>
<td>25</td>
</blockquote></tr>
<tr>
<blockquote><td>sql.safe_mode</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>track_errors</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>unserialize_callback_func</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>upload_max_filesize</td>
<td>10M</td>
<td>10M</td>
</blockquote></tr>
<tr>
<blockquote><td>upload_tmp_dir</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>user_dir</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>user_ini.cache_ttl</td>
<td>300</td>
<td>300</td>
</blockquote></tr>
<tr>
<blockquote><td>user_ini.filename</td>
<td>.user.ini</td>
<td>.user.ini</td>
</blockquote></tr>
<tr>
<blockquote><td>variables_order</td>
<td>EGPCS</td>
<td>EGPCS</td>
</blockquote></tr>
<tr>
<blockquote><td>xmlrpc_error_number</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>xmlrpc_errors</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>zend.detect_unicode</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>zend.enable_gc</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>zend.multibyte</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>zend.script_encoding</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>ctype</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>ctype functions </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>curl</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>cURL support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>cURL Information </td>
<td>7.25.0 </td>
</blockquote></tr>
<tr>
<blockquote><td>Age </td>
<td>3 </td>
</blockquote></tr>
<tr>
<blockquote><td>Features </td>
</blockquote></tr>
<tr>
<blockquote><td>AsynchDNS </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>Debug </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>GSS-Negotiate </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>IDN </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>IPv6 </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>Largefile </td>
<td>Yes </td>
</blockquote></tr>
<tr>
<blockquote><td>NTLM </td>
<td>Yes </td>
</blockquote></tr>
<tr>
<blockquote><td>SPNEGO </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>SSL </td>
<td>Yes </td>
</blockquote></tr>
<tr>
<blockquote><td>SSPI </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>krb4 </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>libz </td>
<td>Yes </td>
</blockquote></tr>
<tr>
<blockquote><td>CharConv </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>Protocols </td>
<td>dict, file, ftp, ftps, gopher, http, https, imap,<br>
<blockquote>imaps, pop3, pop3s, rtsp, smtp, smtps, telnet, tftp </td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Host </td>
<td>arm-apple-darwin9 </td>
</blockquote></tr>
<tr>
<blockquote><td>SSL Version </td>
<td>OpenSSL/0.9.8y </td>
</blockquote></tr>
<tr>
<blockquote><td>ZLib Version </td>
<td>1.2.5 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>date</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>date/time support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>"Olson" Timezone Database Version </td>
<td>2013.3 </td>
</blockquote></tr>
<tr>
<blockquote><td>Timezone Database </td>
<td>internal </td>
</blockquote></tr>
<tr>
<blockquote><td>Default timezone </td>
<td>UTC </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>date.default_latitude</td>
<td>31.7667</td>
<td>31.7667</td>
</blockquote></tr>
<tr>
<blockquote><td>date.default_longitude</td>
<td>35.2333</td>
<td>35.2333</td>
</blockquote></tr>
<tr>
<blockquote><td>date.sunrise_zenith</td>
<td>90.583333</td>
<td>90.583333</td>
</blockquote></tr>
<tr>
<blockquote><td>date.sunset_zenith</td>
<td>90.583333</td>
<td>90.583333</td>
</blockquote></tr>
<tr>
<blockquote><td>date.timezone</td>
<td>UTC</td>
<td>UTC</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>dom</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>DOM/XML </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>DOM/XML API Version </td>
<td>20031129 </td>
</blockquote></tr>
<tr>
<blockquote><td>libxml Version </td>
<td>2.7.3 </td>
</blockquote></tr>
<tr>
<blockquote><td>HTML Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>XPath Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>XPointer Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Schema Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>RelaxNG Support </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>ereg</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Regex Library </td>
<td>Bundled library enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>exif</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>EXIF Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>EXIF Version </td>
<td>1.4 $Id$ </td>
</blockquote></tr>
<tr>
<blockquote><td>Supported EXIF Version </td>
<td>0220 </td>
</blockquote></tr>
<tr>
<blockquote><td>Supported filetypes </td>
<td>JPEG,TIFF </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>exif.decode_jis_intel</td>
<td>JIS</td>
<td>JIS</td>
</blockquote></tr>
<tr>
<blockquote><td>exif.decode_jis_motorola</td>
<td>JIS</td>
<td>JIS</td>
</blockquote></tr>
<tr>
<blockquote><td>exif.decode_unicode_intel</td>
<td>UCS-2LE</td>
<td>UCS-2LE</td>
</blockquote></tr>
<tr>
<blockquote><td>exif.decode_unicode_motorola</td>
<td>UCS-2BE</td>
<td>UCS-2BE</td>
</blockquote></tr>
<tr>
<blockquote><td>exif.encode_jis</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>exif.encode_unicode</td>
<td>ISO-8859-15</td>
<td>ISO-8859-15</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>fileinfo</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>fileinfo support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>version </td>
<td>1.0.5 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>filter</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Input Validation and Filtering </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Revision </td>
<td>$Id: 2aa8dd57d9c0c655cd45e6e5872bb95fa5ad76cf $ </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>filter.default</td>
<td>unsafe_raw</td>
<td>unsafe_raw</td>
</blockquote></tr>
<tr>
<blockquote><td>filter.default_flags</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>gd</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>GD Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>GD Version </td>
<td>bundled (2.1.0 compatible) </td>
</blockquote></tr>
<tr>
<blockquote><td>FreeType Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>FreeType Linkage </td>
<td>with freetype </td>
</blockquote></tr>
<tr>
<blockquote><td>FreeType Version </td>
<td>2.4.11 </td>
</blockquote></tr>
<tr>
<blockquote><td>GIF Read Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>GIF Create Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>JPEG Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>libJPEG Version </td>
<td>8 </td>
</blockquote></tr>
<tr>
<blockquote><td>PNG Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>libPNG Version </td>
<td>1.2.50 </td>
</blockquote></tr>
<tr>
<blockquote><td>WBMP Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>XBM Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>JIS-mapped Japanese Font Support </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>gd.jpeg_ignore_warning</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>hash</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>hash support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Hashing Engines </td>
<td>md2 md4 md5 sha1 sha224 sha256 sha384 sha512 ripemd128<br>
<blockquote>ripemd160 ripemd256 ripemd320 whirlpool tiger128,3 tiger160,3<br>
tiger192,3 tiger128,4 tiger160,4 tiger192,4 snefru snefru256 gost<br>
adler32 crc32 crc32b fnv132 fnv164 joaat haval128,3 haval160,3<br>
haval192,3 haval224,3 haval256,3 haval128,4 haval160,4 haval192,4<br>
haval224,4 haval256,4 haval128,5 haval160,5 haval192,5 haval224,5<br>
haval256,5 </td>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>iconv</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>iconv support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>iconv implementation </td>
<td>unknown </td>
</blockquote></tr>
<tr>
<blockquote><td>iconv library version </td>
<td>unknown </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>iconv.input_encoding</td>
<td>ISO-8859-1</td>
<td>ISO-8859-1</td>
</blockquote></tr>
<tr>
<blockquote><td>iconv.internal_encoding</td>
<td>ISO-8859-1</td>
<td>ISO-8859-1</td>
</blockquote></tr>
<tr>
<blockquote><td>iconv.output_encoding</td>
<td>ISO-8859-1</td>
<td>ISO-8859-1</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>json</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>json support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>json version </td>
<td>1.2.1 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>libxml</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>libXML support </td>
<td>active </td>
</blockquote></tr>
<tr>
<blockquote><td>libXML Compiled Version </td>
<td>2.7.3 </td>
</blockquote></tr>
<tr>
<blockquote><td>libXML Loaded Version </td>
<td>20708 </td>
</blockquote></tr>
<tr>
<blockquote><td>libXML streams </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>mbstring</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Multibyte Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Multibyte string engine </td>
<td>libmbfl </td>
</blockquote></tr>
<tr>
<blockquote><td>HTTP input encoding translation </td>
<td>disabled </td>
</blockquote></tr>
<tr>
<blockquote><td>libmbfl version </td>
<td>1.3.2 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>mbstring extension makes use of "streamable kanji code filter<br>
<blockquote>and converter", which is distributed under the GNU Lesser General<br>
Public License version 2.1.</th>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Multibyte (japanese) regex support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Multibyte regex (oniguruma) backtrack check </td>
<td>On </td>
</blockquote></tr>
<tr>
<blockquote><td>Multibyte regex (oniguruma) version </td>
<td>4.7.1 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.detect_order</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.encoding_translation</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.func_overload</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.http_input</td>
<td>pass</td>
<td>pass</td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.http_output</td>
<td>pass</td>
<td>pass</td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.http_output_conv_mimetypes</td>
<td>^(text/|application/xhtml\+xml)</td>
<td>^(text/|application/xhtml\+xml)</td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.internal_encoding</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.language</td>
<td>neutral</td>
<td>neutral</td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.strict_detection</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>mbstring.substitute_character</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>mcrypt</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>mcrypt support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><th>mcrypt_filter support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Version </td>
<td>2.5.8 </td>
</blockquote></tr>
<tr>
<blockquote><td>Api No </td>
<td>20021217 </td>
</blockquote></tr>
<tr>
<blockquote><td>Supported ciphers </td>
<td>cast-128 gost rijndael-128 twofish arcfour cast-256<br>
<blockquote>loki97 rijndael-192 saferplus wake blowfish-compat des<br>
rijndael-256 serpent xtea blowfish enigma rc2 tripledes </td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Supported modes </td>
<td>cbc cfb ctr ecb ncfb nofb ofb stream </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>mcrypt.algorithms_dir</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mcrypt.modes_dir</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>mysql</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>MySQL Support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Active Persistent Links </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>Active Links </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>Client API version </td>
<td>mysqlnd 5.0.10 - 20111026 - $Id:<br>
<blockquote>e707c415db32080b3752b232487a435ee0372157 $ </td>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>mysql.allow_local_infile</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.allow_persistent</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.connect_timeout</td>
<td>60</td>
<td>60</td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.default_host</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.default_password</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.default_port</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.default_socket</td>
<td>/tmp/mysql.sock</td>
<td>/tmp/mysql.sock</td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.default_user</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.max_links</td>
<td>Unlimited</td>
<td>Unlimited</td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.max_persistent</td>
<td>Unlimited</td>
<td>Unlimited</td>
</blockquote></tr>
<tr>
<blockquote><td>mysql.trace_mode</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>mysqli</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>MysqlI Support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Client API library version </td>
<td>mysqlnd 5.0.10 - 20111026 - $Id:<br>
<blockquote>e707c415db32080b3752b232487a435ee0372157 $ </td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Active Persistent Links </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>Inactive Persistent Links </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>Active Links </td>
<td>0 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.allow_local_infile</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.allow_persistent</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.default_host</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.default_port</td>
<td>3306</td>
<td>3306</td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.default_pw</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.default_socket</td>
<td>/tmp/mysql.sock</td>
<td>/tmp/mysql.sock</td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.default_user</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.max_links</td>
<td>Unlimited</td>
<td>Unlimited</td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.max_persistent</td>
<td>Unlimited</td>
<td>Unlimited</td>
</blockquote></tr>
<tr>
<blockquote><td>mysqli.reconnect</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>mysqlnd</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>mysqlnd</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Version </td>
<td>mysqlnd 5.0.10 - 20111026 - $Id:<br>
<blockquote>e707c415db32080b3752b232487a435ee0372157 $ </td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Compression </td>
<td>supported </td>
</blockquote></tr>
<tr>
<blockquote><td>SSL </td>
<td>supported </td>
</blockquote></tr>
<tr>
<blockquote><td>Command buffer size </td>
<td>4096 </td>
</blockquote></tr>
<tr>
<blockquote><td>Read buffer size </td>
<td>32768 </td>
</blockquote></tr>
<tr>
<blockquote><td>Read timeout </td>
<td>31536000 </td>
</blockquote></tr>
<tr>
<blockquote><td>Collecting statistics </td>
<td>Yes </td>
</blockquote></tr>
<tr>
<blockquote><td>Collecting memory statistics </td>
<td>No </td>
</blockquote></tr>
<tr>
<blockquote><td>Tracing </td>
<td>n/a </td>
</blockquote></tr>
<tr>
<blockquote><td>Loaded plugins </td>
<td>mysqlnd,example,debug_trace,auth_plugin_mysql_native_password,auth_plugin_mysql_clear_password<br>
<blockquote></td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>API Extensions </td>
<td>mysqli,mysql,pdo_mysql </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>mysqlnd statistics</th>
<th> <br />
</th>
</blockquote></tr>
<tr>
<blockquote><td>bytes_sent </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_sent </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>protocol_overhead_in </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>protocol_overhead_out </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_ok_packet </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_eof_packet </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_rset_header_packet </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_rset_field_meta_packet </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_rset_row_packet </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_prepare_response_packet </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_change_user_packet </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_sent_command </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received_ok </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received_eof </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received_rset_header </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received_rset_field_meta </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received_rset_row </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received_prepare_response </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>packets_received_change_user </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>result_set_queries </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>non_result_set_queries </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>no_index_used </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bad_index_used </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>slow_queries </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>buffered_sets </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>unbuffered_sets </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>ps_buffered_sets </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>ps_unbuffered_sets </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>flushed_normal_sets </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>flushed_ps_sets </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>ps_prepared_never_executed </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>ps_prepared_once_executed </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_fetched_from_server_normal </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_fetched_from_server_ps </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_buffered_from_client_normal </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_buffered_from_client_ps </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_fetched_from_client_normal_buffered </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_fetched_from_client_normal_unbuffered </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_fetched_from_client_ps_buffered </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_fetched_from_client_ps_unbuffered </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_fetched_from_client_ps_cursor </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_affected_normal </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_affected_ps </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_skipped_normal </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>rows_skipped_ps </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>copy_on_write_saved </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>copy_on_write_performed </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>command_buffer_too_small </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>connect_success </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>connect_failure </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>connection_reused </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>reconnect </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>pconnect_success </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>active_connections </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>active_persistent_connections </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>explicit_close </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>implicit_close </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>disconnect_close </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>in_middle_of_command_close </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>explicit_free_result </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>implicit_free_result </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>explicit_stmt_close </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>implicit_stmt_close </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_emalloc_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_emalloc_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_ecalloc_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_ecalloc_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_erealloc_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_erealloc_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_efree_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_efree_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_malloc_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_malloc_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_calloc_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_calloc_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_realloc_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_realloc_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_free_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_free_amount </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_estrndup_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_strndup_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_estndup_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>mem_strdup_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_null </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_bit </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_tinyint </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_short </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_int24 </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_int </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_bigint </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_decimal </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_float </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_double </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_date </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_year </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_time </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_datetime </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_timestamp </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_string </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_blob </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_enum </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_set </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_geometry </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_text_fetched_other </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_null </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_bit </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_tinyint </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_short </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_int24 </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_int </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_bigint </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_decimal </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_float </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_double </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_date </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_year </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_time </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_datetime </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_timestamp </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_string </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_blob </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_enum </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_set </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_geometry </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>proto_binary_fetched_other </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>init_command_executed_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>init_command_failed_count </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_quit </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_init_db </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_query </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_field_list </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_create_db </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_drop_db </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_refresh </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_shutdown </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_statistics </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_process_info </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_connect </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_process_kill </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_debug </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_ping </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_time </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_delayed_insert </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_change_user </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_binlog_dump </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_table_dump </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_connect_out </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_register_slave </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_stmt_prepare </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_stmt_execute </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_stmt_send_long_data </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_stmt_close </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_stmt_reset </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_stmt_set_option </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_stmt_fetch </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>com_deamon </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_real_data_normal </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>bytes_received_real_data_ps </td>
<td>0 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>example statistics</th>
<th> <br />
</th>
</blockquote></tr>
<tr>
<blockquote><td>stat1 </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>stat2 </td>
<td>0 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>openssl</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>OpenSSL support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>OpenSSL Library Version </td>
<td>OpenSSL 0.9.8y 5 Feb 2013 </td>
</blockquote></tr>
<tr>
<blockquote><td>OpenSSL Header Version </td>
<td>OpenSSL 0.9.8y 5 Feb 2013 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>pcre</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>PCRE (Perl Compatible Regular Expressions) Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>PCRE Library Version </td>
<td>8.32 2012-11-30 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>pcre.backtrack_limit</td>
<td>1000000</td>
<td>1000000</td>
</blockquote></tr>
<tr>
<blockquote><td>pcre.recursion_limit</td>
<td>100000</td>
<td>100000</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>PDO</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>PDO support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>PDO drivers </td>
<td>sqlite, mysql, pgsql </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>pdo_mysql</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>PDO Driver for MySQL</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Client API version </td>
<td>mysqlnd 5.0.10 - 20111026 - $Id:<br>
<blockquote>e707c415db32080b3752b232487a435ee0372157 $ </td>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>pdo_mysql.default_socket</td>
<td>/tmp/mysql.sock</td>
<td>/tmp/mysql.sock</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>pdo_pgsql</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>PDO Driver for PostgreSQL</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>PostgreSQL(libpq) Version </td>
<td>9.2.4 </td>
</blockquote></tr>
<tr>
<blockquote><td>Module version </td>
<td>1.0.2 </td>
</blockquote></tr>
<tr>
<blockquote><td>Revision </td>
<td> $Id$ </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>pdo_sqlite</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>PDO Driver for SQLite 3.x</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>SQLite Library </td>
<td>3.7.7.1 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>pgsql</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>PostgreSQL Support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>PostgreSQL(libpq) Version </td>
<td>9.2.4 </td>
</blockquote></tr>
<tr>
<blockquote><td>PostgreSQL(libpq) </td>
<td>PostgreSQL 9.2.4 on arm-apple-darwin, compiled by<br>
<blockquote>arm-apple-darwin10-llvm-gcc-4.2 (GCC) 4.2.1 (Based on Apple Inc.<br>
build 5658) (LLVM build 2410.2.00), 32-bit </td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Multibyte character support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>SSL support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Active Persistent Links </td>
<td>0 </td>
</blockquote></tr>
<tr>
<blockquote><td>Active Links </td>
<td>0 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>pgsql.allow_persistent</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>pgsql.auto_reset_persistent</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>pgsql.ignore_notice</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>pgsql.log_notice</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>pgsql.max_links</td>
<td>Unlimited</td>
<td>Unlimited</td>
</blockquote></tr>
<tr>
<blockquote><td>pgsql.max_persistent</td>
<td>Unlimited</td>
<td>Unlimited</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>Phar</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Phar: PHP Archive support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Phar EXT version </td>
<td>2.0.1 </td>
</blockquote></tr>
<tr>
<blockquote><td>Phar API version </td>
<td>1.1.1 </td>
</blockquote></tr>
<tr>
<blockquote><td>SVN revision </td>
<td>$Id: c5042cc34acebcc0926625b57dff03deebbe6472 $ </td>
</blockquote></tr>
<tr>
<blockquote><td>Phar-based phar archives </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Tar-based phar archives </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>ZIP-based phar archives </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>gzip compression </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>bzip2 compression </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>OpenSSL support </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>
<blockquote>Phar based on pear/PHP_Archive, original concept by Davey Shafik.<br />
Phar fully realized by Gregory Beaver and Marcus Boerger.<br />
Portions of tar implementation Copyright (c) 2003-2009 Tim<br>
Kientzle.</td>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>phar.cache_list</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>phar.readonly</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>phar.require_hash</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>posix</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Revision </td>
<td>$Id: 32db6705f5b617967a546be3114e178a4138c1ca $ </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>Reflection</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Reflection</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Version </td>
<td>$Id: 6c4d8062369898a397e4b128348042f5c01b4427 $ </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>session</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Session Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Registered save handlers </td>
<td>files user </td>
</blockquote></tr>
<tr>
<blockquote><td>Registered serializer handlers </td>
<td>php php_binary </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>session.auto_start</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>session.cache_expire</td>
<td>180</td>
<td>180</td>
</blockquote></tr>
<tr>
<blockquote><td>session.cache_limiter</td>
<td>nocache</td>
<td>nocache</td>
</blockquote></tr>
<tr>
<blockquote><td>session.cookie_domain</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>session.cookie_httponly</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>session.cookie_lifetime</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>session.cookie_path</td>
<td>/</td>
<td>/</td>
</blockquote></tr>
<tr>
<blockquote><td>session.cookie_secure</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>session.entropy_file</td>
<td>/dev/urandom</td>
<td>/dev/urandom</td>
</blockquote></tr>
<tr>
<blockquote><td>session.entropy_length</td>
<td>32</td>
<td>32</td>
</blockquote></tr>
<tr>
<blockquote><td>session.gc_divisor</td>
<td>100</td>
<td>100</td>
</blockquote></tr>
<tr>
<blockquote><td>session.gc_maxlifetime</td>
<td>1440</td>
<td>1440</td>
</blockquote></tr>
<tr>
<blockquote><td>session.gc_probability</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>session.hash_bits_per_character</td>
<td>4</td>
<td>4</td>
</blockquote></tr>
<tr>
<blockquote><td>session.hash_function</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>session.name</td>
<td>PHPSESSID</td>
<td>PHPSESSID</td>
</blockquote></tr>
<tr>
<blockquote><td>session.referer_check</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>session.save_handler</td>
<td>files</td>
<td>files</td>
</blockquote></tr>
<tr>
<blockquote><td>session.save_path</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>session.serialize_handler</td>
<td>php</td>
<td>php</td>
</blockquote></tr>
<tr>
<blockquote><td>session.upload_progress.cleanup</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>session.upload_progress.enabled</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>session.upload_progress.freq</td>
<td>1%</td>
<td>1%</td>
</blockquote></tr>
<tr>
<blockquote><td>session.upload_progress.min_freq</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>session.upload_progress.name</td>
<td>PHP_SESSION_UPLOAD_PROGRESS</td>
<td>PHP_SESSION_UPLOAD_PROGRESS</td>
</blockquote></tr>
<tr>
<blockquote><td>session.upload_progress.prefix</td>
<td>upload_progress<i></td></i><td>upload_progress<i></td>
</blockquote></tr></i><tr>
<blockquote><td>session.use_cookies</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>session.use_only_cookies</td>
<td>On</td>
<td>On</td>
</blockquote></tr>
<tr>
<blockquote><td>session.use_trans_sid</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>SimpleXML</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Simplexml support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Revision </td>
<td>$Id: 692516840b2d7d6e7aedb0bedded1f53b764a99f $ </td>
</blockquote></tr>
<tr>
<blockquote><td>Schema support </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>soap</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Soap Client </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Soap Server </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>soap.wsdl_cache</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>soap.wsdl_cache_dir</td>
<td>/tmp</td>
<td>/tmp</td>
</blockquote></tr>
<tr>
<blockquote><td>soap.wsdl_cache_enabled</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>soap.wsdl_cache_limit</td>
<td>5</td>
<td>5</td>
</blockquote></tr>
<tr>
<blockquote><td>soap.wsdl_cache_ttl</td>
<td>86400</td>
<td>86400</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>SPL</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>SPL support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Interfaces </td>
<td>Countable, OuterIterator, RecursiveIterator,<br>
<blockquote>SeekableIterator, SplObserver, SplSubject </td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td>Classes </td>
<td>AppendIterator, ArrayIterator, ArrayObject,<br>
<blockquote>BadFunctionCallException, BadMethodCallException, CachingIterator,<br>
CallbackFilterIterator, DirectoryIterator, DomainException,<br>
EmptyIterator, FilesystemIterator, FilterIterator, GlobIterator,<br>
InfiniteIterator, InvalidArgumentException, IteratorIterator,<br>
LengthException, LimitIterator, LogicException, MultipleIterator,<br>
NoRewindIterator, OutOfBoundsException, OutOfRangeException,<br>
OverflowException, ParentIterator, RangeException,<br>
RecursiveArrayIterator, RecursiveCachingIterator,<br>
RecursiveCallbackFilterIterator, RecursiveDirectoryIterator,<br>
RecursiveFilterIterator, RecursiveIteratorIterator,<br>
RecursiveRegexIterator, RecursiveTreeIterator, RegexIterator,<br>
RuntimeException, SplDoublyLinkedList, SplFileInfo, SplFileObject,<br>
SplFixedArray, SplHeap, SplMinHeap, SplMaxHeap, SplObjectStorage,<br>
SplPriorityQueue, SplQueue, SplStack, SplTempFileObject,<br>
UnderflowException, UnexpectedValueException </td>
</blockquote></blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>sqlite3</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>SQLite3 support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>SQLite3 module version </td>
<td>0.7 </td>
</blockquote></tr>
<tr>
<blockquote><td>SQLite Library </td>
<td>3.7.7.1 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>sqlite3.extension_dir</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>standard</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Dynamic Library Support </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Path to sendmail </td>
<td> -t -i </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>assert.active</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>assert.bail</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>assert.callback</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>assert.quiet_eval</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>assert.warning</td>
<td>1</td>
<td>1</td>
</blockquote></tr>
<tr>
<blockquote><td>auto_detect_line_endings</td>
<td>0</td>
<td>0</td>
</blockquote></tr>
<tr>
<blockquote><td>default_socket_timeout</td>
<td>60</td>
<td>60</td>
</blockquote></tr>
<tr>
<blockquote><td>from</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td>url_rewriter.tags</td>
<td>a=href,area=href,frame=src,form=,fieldset=</td>
<td>a=href,area=href,frame=src,form=,fieldset=</td>
</blockquote></tr>
<tr>
<blockquote><td>user_agent</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>tokenizer</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Tokenizer Support </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>xml</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>XML Support </td>
<td>active </td>
</blockquote></tr>
<tr>
<blockquote><td>XML Namespace Support </td>
<td>active </td>
</blockquote></tr>
<tr>
<blockquote><td>libxml2 Version </td>
<td>2.7.3 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>xmlreader</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>XMLReader </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>xmlwriter</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>XMLWriter </td>
<td>enabled </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>xsl</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>XSL </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>libxslt Version </td>
<td>1.1.26 </td>
</blockquote></tr>
<tr>
<blockquote><td>libxslt compiled against libxml Version </td>
<td>2.7.8 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>zip</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>Zip </td>
<td>enabled </td>
</blockquote></tr>
<tr>
<blockquote><td>Extension Version </td>
<td>$Id: 0c033d4e4613d577409950ed7bf8da4b68286d15 $ </td>
</blockquote></tr>
<tr>
<blockquote><td>Zip version </td>
<td>1.11.0 </td>
</blockquote></tr>
<tr>
<blockquote><td>Libzip version </td>
<td>0.10.1 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2><a>zlib</a></h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>ZLib Support</th>
<th>enabled</th>
</blockquote></tr>
<tr>
<blockquote><td>Stream Wrapper </td>
<td>compress.zlib:// </td>
</blockquote></tr>
<tr>
<blockquote><td>Stream Filter </td>
<td>zlib.inflate, zlib.deflate </td>
</blockquote></tr>
<tr>
<blockquote><td>Compiled Version </td>
<td>1.2.3 </td>
</blockquote></tr>
<tr>
<blockquote><td>Linked Version </td>
<td>1.2.5 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Directive</th>
<th>Local Value</th>
<th>Master Value</th>
</blockquote></tr>
<tr>
<blockquote><td>zlib.output_compression</td>
<td>Off</td>
<td>Off</td>
</blockquote></tr>
<tr>
<blockquote><td>zlib.output_compression_level</td>
<td>-1</td>
<td>-1</td>
</blockquote></tr>
<tr>
<blockquote><td>zlib.output_handler</td>
<td><i>no value</i></td>
<td><i>no value</i></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2>Additional Modules</h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Module Name</th>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2>Environment</h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Variable</th>
<th>Value</th>
</blockquote></tr>
<tr>
<blockquote><td>PATH </td>
<td>/usr/bin:/bin:/usr/sbin:/sbin </td>
</blockquote></tr>
<tr>
<blockquote><td>CF_USER_TEXT_ENCODING </td>
<td>0x0:0:0 </td>
</blockquote></tr>
<tr>
<blockquote><td>DYLD_INSERT_LIBRARIES </td>
<td>/Library/MobileSubstrate/MobileSubstrate.dylib </td>
</blockquote></tr>
<tr>
<blockquote><td>PHP_FCGI_CHILDREN </td>
<td>2 </td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2>PHP Variables</h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><th>Variable</th>
<th>Value</th>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["PATH"]</td></i><td>/usr/bin:/bin:/usr/sbin:/sbin</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["</i><i>CF_USER_TEXT_ENCODING"]</td></i><td>0x0:0:0</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["DYLD_INSERT_LIBRARIES"]</td></i><td>/Library/MobileSubstrate/MobileSubstrate.dylib</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["PHP_FCGI_CHILDREN"]</td></i><td>2</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["HTTP_ACCEPT_LANGUAGE"]</td></i><td>de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["HTTP_ACCEPT_ENCODING"]</td></i><td>gzip,deflate,sdch</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["HTTP_USER_AGENT"]</td></i><td>Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36<br>
<blockquote>(KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36</td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td><i>SERVER["HTTP_ACCEPT"]</td></i><td>text/html,application/xhtml+xml,application/xml;q=0.9,<b>/</b>;q=0.8</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["HTTP_CONNECTION"]</td></i><td>keep-alive</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["HTTP_HOST"]</td></i><td>www.blauerbecher.de</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["HTTPS"]</td></i><td>on</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["SERVER_PROTOCOL"]</td></i><td>HTTP/1.1</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["REDIRECT_STATUS"]</td></i><td>200</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["REQUEST_METHOD"]</td></i><td>GET</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["QUERY_STRING"]</td></i><td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["REQUEST_URI"]</td></i><td>/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["DOCUMENT_ROOT"]</td></i><td>/var/www/</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["SCRIPT_FILENAME"]</td></i><td>/var/www/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["PATH_INFO"]</td></i><td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["SCRIPT_NAME"]</td></i><td>/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["REMOTE_ADDR"]</td></i><td>79.218.69.66</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["REMOTE_PORT"]</td></i><td>51122</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["SERVER_ADDR"]</td></i><td>192.168.1.21</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["SERVER_PORT"]</td></i><td>443</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["GATEWAY_INTERFACE"]</td></i><td>CGI/1.1</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["SERVER_NAME"]</td></i><td>www.blauerbecher.de</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["SERVER_SOFTWARE"]</td></i><td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["FCGI_ROLE"]</td></i><td>RESPONDER</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["PHP_SELF"]</td></i><td>/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["REQUEST_TIME_FLOAT"]</td></i><td>1371910477.053</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["REQUEST_TIME"]</td></i><td>1371910477</td>
</blockquote></tr>
<tr>
<blockquote><td><i>SERVER["argv"]</td></i><td>
<blockquote><pre>Array<br>
(<br>
)<br>
</pre></td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td><i>SERVER["argc"]</td></i><td>0</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["PATH"]</td></i><td>/usr/bin:/bin:/usr/sbin:/sbin</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["</i><i>CF_USER_TEXT_ENCODING"]</td></i><td>0x0:0:0</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["DYLD_INSERT_LIBRARIES"]</td></i><td>/Library/MobileSubstrate/MobileSubstrate.dylib</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["PHP_FCGI_CHILDREN"]</td></i><td>2</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["HTTP_ACCEPT_LANGUAGE"]</td></i><td>de-DE,de;q=0.8,en-US;q=0.6,en;q=0.4</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["HTTP_ACCEPT_ENCODING"]</td></i><td>gzip,deflate,sdch</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["HTTP_USER_AGENT"]</td></i><td>Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36<br>
<blockquote>(KHTML, like Gecko) Chrome/27.0.1453.116 Safari/537.36</td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td><i>ENV["HTTP_ACCEPT"]</td></i><td>text/html,application/xhtml+xml,application/xml;q=0.9,<b>/</b>;q=0.8</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["HTTP_CONNECTION"]</td></i><td>keep-alive</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["HTTP_HOST"]</td></i><td>www.blauerbecher.de</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["HTTPS"]</td></i><td>on</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["SERVER_PROTOCOL"]</td></i><td>HTTP/1.1</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["REDIRECT_STATUS"]</td></i><td>200</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["REQUEST_METHOD"]</td></i><td>GET</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["QUERY_STRING"]</td></i><td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["REQUEST_URI"]</td></i><td>/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["DOCUMENT_ROOT"]</td></i><td>/var/www/</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["SCRIPT_FILENAME"]</td></i><td>/var/www/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["PATH_INFO"]</td></i><td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["SCRIPT_NAME"]</td></i><td>/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["REMOTE_ADDR"]</td></i><td>79.218.69.66</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["REMOTE_PORT"]</td></i><td>51122</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["SERVER_ADDR"]</td></i><td>192.168.1.21</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["SERVER_PORT"]</td></i><td>443</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["GATEWAY_INTERFACE"]</td></i><td>CGI/1.1</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["SERVER_NAME"]</td></i><td>www.blauerbecher.de</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["SERVER_SOFTWARE"]</td></i><td><i>no value</i></td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["FCGI_ROLE"]</td></i><td>RESPONDER</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["PHP_SELF"]</td></i><td>/phpinfo.php</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["REQUEST_TIME_FLOAT"]</td></i><td>1371910477.053</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["REQUEST_TIME"]</td></i><td>1371910477</td>
</blockquote></tr>
<tr>
<blockquote><td><i>ENV["argv"]</td></i><td>
<blockquote><pre>Array<br>
(<br>
)<br>
</pre></td>
</blockquote></blockquote></tr>
<tr>
<blockquote><td><i>ENV["argc"]</td></i><td>0</td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>
<br />
<h2>PHP License</h2>
<table cellpadding='3' width='600' border='1'>
<blockquote><tbody>
<blockquote><tr>
<blockquote><td>
<blockquote><p>
<blockquote>This program is free software; you can redistribute it and/or<br>
modify it under the terms of the PHP License as published by the<br>
PHP Group and included in the distribution in the file: LICENSE<br>
</blockquote></p>
<p>This program is distributed in the hope that it will be useful,<br>
<blockquote>but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.<br>
</blockquote></p>
<p>If you did not receive a copy of the PHP license, or have any<br>
<blockquote>questions about PHP licensing, please contact license@php.net.<br>
</blockquote></p>
</blockquote></td>
</blockquote></tr>
</blockquote></tbody>
</blockquote></table>