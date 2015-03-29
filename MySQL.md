03/2013<br>
<br>
<br>
<br>
<h1>Introduction</h1>

With this project you can run a MySQL server on your jailbroken iOS-Device (AppleTV, iPhone, iPad, iPod Touch).<br>
<br>
<br>
The <b>MySQL versions</b> is the Cluster Community Edition 5.1 .<br>
It supports following database engines:<br>
<ul><li>MyISAM<br>
</li><li>InnoDB (you have to activate it in my.cnf)<br>
</li><li>CSV<br>
</li><li>MRG_MYISAM<br>
</li><li>MEMORY<br>
<br>
<br>
<h1>Usage</h1>
If you just install the package MySQL-ATV you have to finish the setup with a few shell commands.<br>
<h2>Database install</h2>
If you would like to initialize or reinitialize your database files please run the command below from a ssh console:<br>
<pre><code>/usr/local/bin/mysql_install_db --user=daemon<br>
</code></pre>
<h2>Database Setup</h2>
To set your MySQL database root password, please use this command:<br>
<pre><code>/usr/local/bin/mysql_secure_installation<br>
</code></pre>
<h2>Start the Server</h2>
To activate the MySQL server please run following command:<br>
<pre><code>/usr/local/bin/mysqld_safe &amp;<br>
</code></pre>
<br>
<br>
<h1>MySQL Configuration</h1>
<h2>Default Values</h2>
Following values are defined during the server compile/build process.</li></ul>

Path:<br>
<ul><li>Binary -> /usr/local/bin<br>
</li><li>Config file -> /etc/my.cnf</li></ul>

<br>
Default options:<br>
<ul><li>socket  = /tmp/mysql.sock<br>
</li><li>basedir = /usr/local<br>
</li><li>datadir = /var/mysql<br>
</li><li>user = daemon<br>
<br></li></ul>

<h2>Config File</h2>
The package includes an example configuration file <b>/etc/my.cnf</b>.<br>
You will get more server configuration details <a href='http://dev.mysql.com/doc/refman/5.1/en/server-configuration-defaults.html'>here</a>.<br>
Example of <b>/etc/my.cnf</b>:<br>
<pre><code># This is an 'EXAMPLE" option/configuration file for MySQL<br>
# It is for a system with little memory (32M - 64M) where MySQL plays<br>
# an important part, or systems up to 128M where MySQL is used together with<br>
# other programs (such as a web server)<br>
#<br>
# You will get more information here:<br>
# http://dev.mysql.com/doc/refman/5.5/en/server-configuration-defaults.html<br>
#<br>
<br>
# The following options will be passed to all MySQL clients<br>
[client]<br>
#password               = your_password<br>
port                    = 3306<br>
# Be careful with 'socket'.<br>
# The iOS-Webstack tools of MySQL-atv and PHP54/PHP53 need the fixed value '/tmp/mysql.sock'.<br>
# The best doing is do nothing with it.<br>
socket                  = /tmp/mysql.sock<br>
<br>
<br>
# The MySQL server<br>
[mysqld]<br>
basedir                 = /usr/local<br>
datadir                 = /var/mysql<br>
user                    = daemon<br>
pid-file                = /var/run/mysql.pid<br>
port                    = 3306<br>
socket                  = /tmp/mysql.sock<br>
#bind-address=addr      = 127.0.0.1<br>
log-error               = /var/log/mysql.err<br>
table_open_cache        = 4<br>
sort_buffer_size        = 64K<br>
read_buffer_size        = 256K<br>
read_rnd_buffer_size    = 256K<br>
net_buffer_length       = 2K<br>
thread_stack            = 128K<br>
query_cache_size        = 0M<br>
<br>
# required unique id between 1 and 2^32 - 1<br>
# defaults to 1 if master-host is not set<br>
# but will not function as a master if omitted<br>
server-id               = 1<br>
<br>
# Use this option if you have a MySQL server with InnoDB support enabled<br>
# but you do not plan to use it. This will save memory and disk space<br>
# and speed up some things.<br>
# More information here: /usr/local/share/mysql/my-innodb-heavy-4G.cnf<br>
skip-innodb<br>
<br>
<br>
[mysqldump]<br>
quick<br>
max_allowed_packet      = 16M<br>
<br>
[mysql]<br>
no-auto-rehash<br>
<br>
[myisamchk]<br>
key_buffer_size         = 8M<br>
sort_buffer_size        = 8M<br>
read_buffer             = 2M<br>
write_buffer            = 2M<br>
<br>
[mysqlhotcopy]<br>
interactive-timeout<br>
<br>
</code></pre>
<br>
<br>
<h2>Setting up a MySQL SSL configuration</h2>
See <a href='http://www.mysqlfanboy.com/2011/11/simplified-mysql-ssl-connections'>MySQL Fanboy</a>
<br>
<br>
<h1>Compatibility Note</h1>
This packages <b>does not</b> have the same file structure as MySQL from <a href='http://apt.thebigboss.org/onepackage.php?bundleid=com.was.mysql'>BigBoss/was.fm</a> .<br>
Therefore it is a good idea to remove all other MySQL packages before you install the iOS WebStack MySQL.<br>
<br>
<br>
<h1>Add Cydia Repo Source</h1>
You will find the MySQL project package here:<br>
<b><a href='http://ios-webstack.tk/cydia'>http://ios-webstack.tk/cydia</a></b>

You can add it in Cydia, NitoTV or direct with following command:<br>
<pre><code>echo 'deb http://ios-webstack.tk/cydia/ ./' &gt; /etc/apt/sources.list.d/ios-webstack.list<br>
</code></pre>
For your security I advice you to add the PGP public key of the iOS WebStack Cydia repo. (<a href='http://www.ios-webstack.tk/public-key'>How to</a>)<br>
<br>
<br>