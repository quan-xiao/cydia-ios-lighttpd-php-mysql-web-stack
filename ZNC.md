02/2015<br>
<br>
<br>
<br>
<h1>Introduction</h1>
Here you will find some information to install and daemonize ZNC on a jailbroken iOS device like Apple-TV2, iPad, iPod or iPhone.<br>
<br>
<br>
<h1>Be careful !!!!!!</h1>
You should <b>not</b> install ZNC on your daily used iOS device!<br>
ZNC will run in the background and <b>will drain your battery!</b><br>
Therefore, ZNC is more a tool to bring your older and unused iOS device back into use (likewise your Apple-TV2).<br>
<br>
This package does not have an icon, nor should it.<br>
To use this package you must SSH into your device.<br>
<b>If you do not recognize this package you probably should not be using it!</b>
<br>
<br>
<br>
<h1>Install</h1>
<ul><li><a href='https://code.google.com/p/cydia-ios-lighttpd-php-mysql-web-stack/wiki/Main#Add_Cydia_Repo_Source'>Add the iOS-WebStack repo</a>.<br>
</li><li>Search for ZNC in Cydia and then install it (for Apple-TV users: the cydia package name is <code>'tk.ios-webstack.znc'</code>).<br>
<br>
<h1>Configuration</h1>
This instruction will show you how to run ZNC under the system user 'mobile'. It is up to you to use an other system user. But please don't use 'root'!<br></li></ul>


1. SSH in your device as '<b>mobile</b>'.<br>
<br>
2. Generate a basic ZNC configuration:<br>
<br>
Run <code>'znc --makeconf'</code> after installation. It is NOT a good idea to create a new config file manually, please use <code>'znc --makeconf'</code>!<br>
With this command ZNC will create the subfolder <code>.znc</code> in mobile's home folder. In this folder you will find all ZNC config files.<br>
<br>
If you follow the following example, you will get a ZNC administrative user called 'admin'.<br>
This user will then have access to the <b>https</b> website <a href='https://your_device_IP:6697'>https://your_device_IP:6697</a>.<br>
On this site you can then continue the ZNC configuration (e.g. add users, add networks, add channels)<br>
(<b>For this purpose, it is most important that you will enable the global modul 'webadmin'.</b>)<br>
<pre>
Apple-TV:~ mobile$ znc --makeconf<br>
<br>
[ .. ] Checking for list of available modules...<br>
[ >> ] ok<br>
[ ** ] Building new config<br>
[ ** ]<br>
[ ** ] First let's start with some global settings...<br>
[ ** ]<br>
[ ?? ] What port would you like ZNC to listen on? (1025 to 65535): 6697<br>
[ ?? ] Would you like ZNC to listen using SSL? (yes/no) [no]: yes<br>
[ ?? ] Would you like ZNC to listen using both IPv4 and IPv6? (yes/no) [yes]: yes<br>
[ .. ] Verifying the listener...<br>
[ >> ] ok<br>
[ ** ]<br>
[ ** ] -- Global Modules --<br>
[ ** ]<br>
[ ** ] +-----------+----------------------------------------------------------+<br>
[ ** ] | Name      | Description                                              |<br>
[ ** ] +-----------+----------------------------------------------------------+<br>
[ ** ] | partyline | Internal channels and queries for users connected to znc |<br>
[ ** ] | webadmin  | Web based administration module                          |<br>
[ ** ] +-----------+----------------------------------------------------------+<br>
[ ** ] And 10 other (uncommon) modules. You can enable those later.<br>
[ ** ]<br>
[ ?? ] Load global module <partyline>? (yes/no) [no]: no<br>
[ ?? ] Load global module <webadmin>? (yes/no) [no]: yes<br>
[ ** ]<br>
[ ** ] Now we need to set up a user...<br>
[ ** ]<br>
[ ?? ] Username (AlphaNumeric): admin<br>
[ ?? ] Enter Password:<br>
[ ?? ] Confirm Password:<br>
[ ?? ] Would you like this user to be an admin? (yes/no) [yes]: yes<br>
[ ?? ] Nick [admin]: duke<br>
[ ?? ] Alt Nick [duke_]: duke_<br>
[ ?? ] Ident [duke]: duke<br>
[ ?? ] Real Name [Got ZNC?]: Duke<br>
[ ?? ] Bind Host (optional):<br>
[ ?? ] Number of lines to buffer per channel [50]: 500<br>
[ ?? ] Would you like to clear channel buffers after replay? (yes/no) [yes]: yes<br>
[ ?? ] Default channel modes [+stn]: +stn<br>
[ ** ]<br>
[ ** ] -- User Modules --<br>
[ ** ]<br>
[ ** ] +--------------+------------------------------------------------------------------------------------------+<br>
[ ** ] | Name         | Description                                                                              |<br>
[ ** ] +--------------+------------------------------------------------------------------------------------------+<br>
[ ** ] | chansaver    | Keep config up-to-date when user joins/parts                                             |<br>
[ ** ] | controlpanel | Dynamic configuration through IRC. Allows editing only yourself if you're not ZNC admin. |<br>
[ ** ] | perform      | Keeps a list of commands to be executed when ZNC connects to IRC.                        |<br>
[ ** ] | webadmin     | Web based administration module                                                          |<br>
[ ** ] +--------------+------------------------------------------------------------------------------------------+<br>
[ ** ] And 21 other (uncommon) modules. You can enable those later.<br>
[ ** ]<br>
[ ?? ] Load module <chansaver>? (yes/no) [no]: no<br>
[ ?? ] Load module <controlpanel>? (yes/no) [no]: no<br>
[ ?? ] Load module <perform>? (yes/no) [no]: no<br>
[ ?? ] Load module <webadmin>? (yes/no) [no]: no<br>
[ ** ]<br>
[ ?? ] Would you like to set up a network? (yes/no) [no]: no<br>
[ ** ]<br>
[ ?? ] Would you like to set up another user? (yes/no) [no]: no<br>
[ .. ] Writing config [/var/mobile/.znc/configs/znc.conf]...<br>
[ >> ] ok<br>
[ ** ]<br>
[ ** ]To connect to this ZNC you need to connect to it as your IRC server<br>
[ ** ]using the port that you supplied.  You have to supply your login info<br>
[ ** ]as the IRC server password like this: user/network:pass.<br>
[ ** ]<br>
[ ** ]Try something like this in your IRC client...<br>
[ ** ]/server <znc_server_ip> +6697 admin:<pass><br>
[ ** ]And this in your browser...<br>
[ ** ]https://<znc_server_ip>:6697/<br>
[ ** ]<br>
[ ?? ] Launch ZNC now? (yes/no) [yes]: yes<br>
[ .. ] Opening config [/var/mobile/.znc/configs/znc.conf]...<br>
[ >> ] ok<br>
[ .. ] Loading global module [webadmin]...<br>
[ >> ] [/usr/local/lib/znc/webadmin.so]<br>
[ .. ] Binding to port [+6697]...<br>
[ >> ] ok<br>
[ ** ] Loading user [admin]<br>
[ .. ] Forking into the background...<br>
[ >> ] [pid: 17908]<br>
[ ** ] ZNC 1.4 - http://znc.in<br>
</pre>

Well done. ZNC is running now!<br>
<br>
You can kill the running ZNC task with the command <code>'killall znc'</code>.<br>
To restart ZNC just type in <code>'znc'</code>.<br>
(You will find the command <code>'killall'</code> in the cydia package 'shell-cmds'.)<br>
<br>
<br>
Now you have a ZNC user '<i>admin</i>' with the IRC nick '<i>duke</i>'.<br>
<br>
<br>
Again the most important config information:<br>
<pre>
Try something like this in your IRC client...<br>
/server <your_device_IP> +6697 admin:<pass><br>
<br>
And this in your browser...<br>
https://<your_device_IP>:6697/<br>
</pre>

<h1>Extended Configuration</h1>
It might be a good idea to create separate ZNC user for each IRC network.<br>
You can do that within the web interface.<br>
<br>
<br>
<h1>Daemonize ZNC</h1>
With the steps above, ZNC will just run until the next reboot.<br>
After the following step, ZNC will run as long as the Daemon Launcher Services is active (even after a reboot).<br>
<br>
<br>
1. SSH in your device as '<b>root</b>'.<br>
<br>
<br>
2. Please kill a running ZNC task  (e.g. with the command <code>'killall znc'</code>).<br>
<br>
<br>
3. Create the launcher file <code>/Library/LaunchDaemons/tk.ios-webstack.znc.plist</code><br>
with following content:<br>
<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
&lt;!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;<br>
&lt;plist version="1.0"&gt;<br>
&lt;dict&gt;<br>
  &lt;key&gt;Label&lt;/key&gt;<br>
     &lt;string&gt;tk.ios-webstack.znc&lt;/string&gt;<br>
  &lt;key&gt;UserName&lt;/key&gt;<br>
     &lt;string&gt;mobile&lt;/string&gt;<br>
  &lt;key&gt;OnDemand&lt;/key&gt;<br>
    &lt;false/&gt;<br>
  &lt;key&gt;ProgramArguments&lt;/key&gt;<br>
     &lt;array&gt;<br>
        &lt;string&gt;/usr/local/bin/znc&lt;/string&gt;<br>
        &lt;string&gt;-f&lt;/string&gt;<br>
     &lt;/array&gt;<br>
  &lt;key&gt;RunAtLoad&lt;/key&gt;<br>
     &lt;true/&gt;<br>
&lt;/dict&gt;<br>
&lt;/plist&gt;<br>
</code></pre>
<br>
According this file, ZNC will run with privileges of the system user <code>'mobile'</code>.<br>
<br>
<br>
<br>
If you would like start ZNC, please use the following command:<br>
<pre><code><br>
launchctl load /Library/LaunchDaemons/tk.ios-webstack.znc.plist<br>
</code></pre>
If you would like stop ZNC, please use the following command:<br>
<pre><code><br>
launchctl unload /Library/LaunchDaemons/tk.ios-webstack.znc.plist<br>
</code></pre>
<br>
Well done!<br>
<br>
<br>
<br>
<br>
<h1>Links</h1>
Please don't ask me. I'm not a ZNC expert. But the ZNC wiki will help you:<br>
<a href='http://wiki.znc.in/ZNC'>ZNC wiki</a>
<br>
<br>
