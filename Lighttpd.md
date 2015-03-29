01/2013<br>
<br>
<br>
<br>
<h1>Introduction</h1>

With this project you can use the newest version of Lihgttpd on your jailbroken iOS Device (AppleTV, iPhone, iPad, iPod Touch).<br>
<br>
<h1>Lighttpd Configuration</h1>
The package does not include a configuration file.<br>
If you would like create the config file <b>lighttpd.conf</b>, you should place it here: <b>/etc/</b> or here: <b>/etc/lighttpd/</b><br>

Example of <b>/etc/lighttpd.conf</b>:<br>
<pre><code># This is an 'EXAMPLE' configuration file for Lighttpd. <br>
# The configuration is prepared for PHP fast-cgi support.<br>
# It is up to you to change it.<br>
# If you need more information please have a look at following page:<br>
# http://redmine.lighttpd.net/projects/lighttpd/wiki/Docs<br>
<br>
#PHP with fast-cgi<br>
fastcgi.server = ( ".php" =&gt;<br>
  ( "localhost" =&gt;<br>
     (<br>
     "bin-path" =&gt; "/usr/local/bin/php-cgi",<br>
     "socket" =&gt; "/tmp/php.socket",<br>
     "max-procs" =&gt; 1,<br>
     "bin-environment" =&gt; <br>
        (<br>
        "PHP_FCGI_CHILDREN" =&gt; "1"    #if you have a iDevice with &gt;=512KB RAM then you can change it to '2'<br>
        )<br>
     )<br>
  )<br>
<br>
server.document-root           = "/var/www/"<br>
server.port                    = 80<br>
<br>
#If it is possible, please do not change values inside this block:<br>
#[BEGIN] ---- be careful ----<br>
<br>
#If you would like change the Server-Username<br>
#then you have to change the log folder permission<br>
#-&gt; chown -R 'Server-Username':'Server-Groupname' lighttpd<br>
server.username                = "daemon"<br>
server.groupname               = "_www"<br>
<br>
#[END] ---- be careful ----<br>
<br>
server.errorlog                = "/var/log/lighttpd.err"<br>
accesslog.filename             = "/var/log/lighttpd.log"<br>
server.pid-file                = "/var/run/lighttpd.pid"<br>
<br>
server.modules                 = (<br>
            "mod_access",<br>
            "mod_accesslog",<br>
            "mod_fastcgi",<br>
            "mod_cgi",<br>
            "mod_compress",<br>
            "mod_evasive",<br>
            "mod_rewrite"         #for example TYPO3 need this<br>
)<br>
<br>
static-file.exclude-extensions = ( ".fcgi", ".php", ".rb", ".pl", ".cgi", ".inc" )<br>
url.access-deny                = ( "~", ".sqlite")<br>
evasive.max-conns-per-ip       = 10<br>
compress.cache-dir             = "/tmp/"<br>
compress.filetype              = ("text/plain", "text/html")<br>
server.max-fds                 = 256<br>
<br>
<br>
#Don't place important server information in server.tag . Hackers will check them first.<br>
#Try curl -I http://your.iOS-Web.server to see what lighttpd get<br>
server.tag                     = ""<br>
#server.name                   = "www.add_your_servername.com"<br>
#server.max-connections        = 10<br>
#server.error-handler-404      = "404error.html"<br>
#server.kbytes-per-second      = 120<br>
#connection.kbytes-per-second  = 32<br>
<br>
index-file.names = ("index.html", "index.php")<br>
<br>
mimetype.assign             = (<br>
  ".pdf"          =&gt;      "application/pdf",<br>
  ".sig"          =&gt;      "application/pgp-signature",<br>
  ".spl"          =&gt;      "application/futuresplash",<br>
  ".class"        =&gt;      "application/octet-stream",<br>
  ".ps"           =&gt;      "application/postscript",<br>
  ".torrent"      =&gt;      "application/x-bittorrent",<br>
  ".dvi"          =&gt;      "application/x-dvi",<br>
  ".gz"           =&gt;      "application/x-gzip",<br>
  ".pac"          =&gt;      "application/x-ns-proxy-autoconfig",<br>
  ".swf"          =&gt;      "application/x-shockwave-flash",<br>
  ".tar.gz"       =&gt;      "application/x-tgz",<br>
  ".tgz"          =&gt;      "application/x-tgz",<br>
  ".tar"          =&gt;      "application/x-tar",<br>
  ".zip"          =&gt;      "application/zip",<br>
  ".mp3"          =&gt;      "audio/mpeg",<br>
  ".m3u"          =&gt;      "audio/x-mpegurl",<br>
  ".wma"          =&gt;      "audio/x-ms-wma",<br>
  ".wax"          =&gt;      "audio/x-ms-wax",<br>
  ".ogg"          =&gt;      "audio/x-wav",<br>
  ".wav"          =&gt;      "audio/x-wav",<br>
  ".gif"          =&gt;      "image/gif",<br>
  ".jpg"          =&gt;      "image/jpeg",<br>
  ".jpeg"         =&gt;      "image/jpeg",<br>
  ".png"          =&gt;      "image/png",<br>
  ".xbm"          =&gt;      "image/x-xbitmap",<br>
  ".xpm"          =&gt;      "image/x-xpixmap",<br>
  ".xwd"          =&gt;      "image/x-xwindowdump",<br>
  ".css"          =&gt;      "text/css",<br>
  ".html"         =&gt;      "text/html",<br>
  ".htm"          =&gt;      "text/html",<br>
  ".js"           =&gt;      "text/javascript",<br>
  ".asc"          =&gt;      "text/plain",<br>
  ".c"            =&gt;      "text/plain",<br>
  ".conf"         =&gt;      "text/plain",<br>
  ".text"         =&gt;      "text/plain",<br>
  ".txt"          =&gt;      "text/plain",<br>
  ".dtd"          =&gt;      "text/xml",<br>
  ".xml"          =&gt;      "text/xml",<br>
  ".mpeg"         =&gt;      "video/mpeg",<br>
  ".mpg"          =&gt;      "video/mpeg",<br>
  ".mov"          =&gt;      "video/quicktime",<br>
  ".qt"           =&gt;      "video/quicktime",<br>
  ".avi"          =&gt;      "video/x-msvideo",<br>
  ".asf"          =&gt;      "video/x-ms-asf",<br>
  ".asx"          =&gt;      "video/x-ms-asf",<br>
  ".wmv"          =&gt;      "video/x-ms-wmv",<br>
  ".bz2"          =&gt;      "application/x-bzip",<br>
  ".tbz"          =&gt;      "application/x-bzip-compressed-tar",<br>
  ".tar.bz2"      =&gt;      "application/x-bzip-compressed-tar"<br>
)<br>
</code></pre>
<br>

<h1>Start the Server</h1>
With following command you can start your Lighttpd server:<br>
<pre><code>lighttpd -f /etc/lighttpd.conf<br>
</code></pre>
<br>

<h1>Setting up a Lighttpd SSL configuration</h1>
See <a href='http://redmine.lighttpd.net/projects/1/wiki/HowToSimpleSSL'>Lighttpd Wiki</a>
<br>
<br>
<h1>Compatibility Note</h1>
This package has the same file structure as Sauriks older Lighttpd.<br>
Therefore, you can replace the package <b>lighttpd</b> with <b>lighttpd-atv</b>.<br>
<br>
<br>
<h1>Add Cydia Repo Source</h1>
You will find the Lighttpd project package here:<br>
<b><a href='http://ios-webstack.tk/cydia'>http://ios-webstack.tk/cydia</a></b>

You can add it in Cydia, NitoTV or direct with following command:<br>
<pre><code>echo 'deb http://ios-webstack.tk/cydia/ ./' &gt; /etc/apt/sources.list.d/ios-webstack.list<br>
</code></pre>
For your security I advice you to add the PGP public key of the iOS WebStack Cydia repo. (<a href='http://www.ios-webstack.tk/public-key'>How to</a>)<br>
<br>
<br>