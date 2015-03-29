01/2015<br>
<br>
<br>
<br>
<h1>Simple Cron Job Simulation</h1>
With the iOS daemon launcher <b>launchd</b> and a few scripts you can have a simple cron job simulation for iOS.<br>
<br>
The jobs will execute hourly, daily, weekly and monthly or with a seconds counter. The cron jobs are scripts in e.g. /etc/cron/ .<br>
<br>
It is up to you to fill the scripts with your commands.<br>

<h2>Cyclic called Scripts</h2>
Please create following scripts:<br>
<ul><li>/etc/cron/seconds.sh<br>
</li><li>/etc/cron/hourly.sh<br>
</li><li>/etc/cron/daily.sh<br>
</li><li>/etc/cron/weekly.sh<br>
</li><li>/etc/cron/monthly.sh</li></ul>

You can use following template for the scripts:<br>
<pre><code>#!/bin/sh<br>
#This script is executed by the daemon launcher every hour/day/week/month <br>
</code></pre>

After you have created the scripts, please change the executable flag. Use the tool <b>chmod</b> to change the permission to 07xx.<br>
<br>
<br>
<h2>Daemon Launcher Plist</h2>
To execute the above scripts cyclic you have to create following <b>plist</b> files in <b>/Library/LaunchDaemons</b>:<br>

<br>
<b>/Library/LaunchDaemons/com.cron.seconds.plist</b> (here every 900 seconds = 15 minute)<br>
<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;<br>
&lt;plist version="1.0"&gt;<br>
  &lt;dict&gt;<br>
        &lt;key&gt;Label&lt;/key&gt;<br>
          &lt;string&gt;cron job seconds&lt;/string&gt;<br>
        &lt;key&gt;ProgramArguments&lt;/key&gt;<br>
          &lt;array&gt;<br>
            &lt;string&gt;/etc/cron/seconds.sh&lt;/string&gt;<br>
          &lt;/array&gt;<br>
        &lt;key&gt;StartInterval&lt;/key&gt;<br>
            &lt;integer&gt;900&lt;/integer&gt;<br>
        &lt;key&gt;LowPriorityIO&lt;/key&gt;<br>
          &lt;true/&gt;<br>
        &lt;key&gt;StandardErrorPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
        &lt;key&gt;StandardOutPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
  &lt;/dict&gt;<br>
&lt;/plist&gt;<br>
</code></pre>

<br>
<b>/Library/LaunchDaemons/com.cron.hourly.plist</b>
<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;<br>
&lt;plist version="1.0"&gt;<br>
  &lt;dict&gt;<br>
        &lt;key&gt;Label&lt;/key&gt;<br>
          &lt;string&gt;cron job hourly&lt;/string&gt;<br>
        &lt;key&gt;ProgramArguments&lt;/key&gt;<br>
          &lt;array&gt;<br>
            &lt;string&gt;/etc/cron/hourly.sh&lt;/string&gt;<br>
          &lt;/array&gt;<br>
        &lt;key&gt;StartCalendarInterval&lt;/key&gt;<br>
          &lt;dict&gt;<br>
            &lt;key&gt;Minute&lt;/key&gt;<br>
            &lt;integer&gt;0&lt;/integer&gt;<br>
          &lt;/dict&gt;<br>
        &lt;key&gt;LowPriorityIO&lt;/key&gt;<br>
          &lt;true/&gt;<br>
        &lt;key&gt;StandardErrorPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
        &lt;key&gt;StandardOutPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
  &lt;/dict&gt;<br>
&lt;/plist&gt;<br>
</code></pre>

<br>
<b>/Library/LaunchDaemons/com.cron.daily.plist</b>
<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;<br>
&lt;plist version="1.0"&gt;<br>
  &lt;dict&gt;<br>
        &lt;key&gt;Label&lt;/key&gt;<br>
          &lt;string&gt;cron job daily&lt;/string&gt;<br>
        &lt;key&gt;ProgramArguments&lt;/key&gt;<br>
          &lt;array&gt;<br>
            &lt;string&gt;/etc/cron/daily.sh&lt;/string&gt;<br>
          &lt;/array&gt;<br>
        &lt;key&gt;StartCalendarInterval&lt;/key&gt;<br>
          &lt;dict&gt;<br>
            &lt;key&gt;Hour&lt;/key&gt;<br>
            &lt;integer&gt;0&lt;/integer&gt;<br>
            &lt;key&gt;Minute&lt;/key&gt;<br>
            &lt;integer&gt;10&lt;/integer&gt;<br>
          &lt;/dict&gt;<br>
        &lt;key&gt;LowPriorityIO&lt;/key&gt;<br>
          &lt;true/&gt;<br>
        &lt;key&gt;StandardErrorPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
        &lt;key&gt;StandardOutPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
  &lt;/dict&gt;<br>
&lt;/plist&gt;<br>
</code></pre>

<br>
<b>/Library/LaunchDaemons/com.cron.weekly.plist</b>
<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;<br>
&lt;plist version="1.0"&gt;<br>
  &lt;dict&gt;<br>
        &lt;key&gt;Label&lt;/key&gt;<br>
          &lt;string&gt;cron job weekly&lt;/string&gt;<br>
        &lt;key&gt;ProgramArguments&lt;/key&gt;<br>
          &lt;array&gt;<br>
            &lt;string&gt;/etc/cron/weekly.sh&lt;/string&gt;<br>
          &lt;/array&gt;<br>
        &lt;key&gt;StartCalendarInterval&lt;/key&gt;<br>
          &lt;dict&gt;<br>
            &lt;key&gt;Weekday&lt;/key&gt;<br>
            &lt;integer&gt;1&lt;/integer&gt;<br>
            &lt;key&gt;Hour&lt;/key&gt;<br>
            &lt;integer&gt;1&lt;/integer&gt;<br>
            &lt;key&gt;Minute&lt;/key&gt;<br>
            &lt;integer&gt;20&lt;/integer&gt;<br>
          &lt;/dict&gt;<br>
        &lt;key&gt;LowPriorityIO&lt;/key&gt;<br>
          &lt;true/&gt;<br>
        &lt;key&gt;StandardErrorPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
        &lt;key&gt;StandardOutPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
  &lt;/dict&gt;<br>
&lt;/plist&gt;<br>
</code></pre>

<br>
<b>/Library/LaunchDaemons/com.cron.monthly.plist</b>
<pre><code>&lt;?xml version="1.0" encoding="UTF-8"?&gt;<br>
&lt;!DOCTYPE plist PUBLIC "-//Apple Computer//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd"&gt;<br>
&lt;plist version="1.0"&gt;<br>
  &lt;dict&gt;<br>
        &lt;key&gt;Label&lt;/key&gt;<br>
          &lt;string&gt;cron job monthly&lt;/string&gt;<br>
        &lt;key&gt;ProgramArguments&lt;/key&gt;<br>
          &lt;array&gt;<br>
            &lt;string&gt;/etc/cron/monthly.sh&lt;/string&gt;<br>
          &lt;/array&gt;<br>
        &lt;key&gt;StartCalendarInterval&lt;/key&gt;<br>
          &lt;dict&gt;<br>
            &lt;key&gt;Day&lt;/key&gt;<br>
            &lt;integer&gt;1&lt;/integer&gt;<br>
            &lt;key&gt;Hour&lt;/key&gt;<br>
            &lt;integer&gt;2&lt;/integer&gt;<br>
            &lt;key&gt;Minute&lt;/key&gt;<br>
            &lt;integer&gt;30&lt;/integer&gt;<br>
          &lt;/dict&gt;<br>
        &lt;key&gt;LowPriorityIO&lt;/key&gt;<br>
          &lt;true/&gt;<br>
        &lt;key&gt;StandardErrorPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
        &lt;key&gt;StandardOutPath&lt;/key&gt;<br>
          &lt;string&gt;/dev/null&lt;/string&gt;<br>
  &lt;/dict&gt;<br>
&lt;/plist&gt;<br>
</code></pre>

<br>
<h2>Start/Stop the Services</h2>
With the tool <b>launchctl</b> you can now start or stop the services.<br>
<br>
<br>
<b>Start</b>
<pre><code>launchctl load  /Library/LaunchDaemons/com.cron.seconds.plist<br>
launchctl load  /Library/LaunchDaemons/com.cron.hourly.plist<br>
launchctl load  /Library/LaunchDaemons/com.cron.daily.plist<br>
launchctl load  /Library/LaunchDaemons/com.cron.weekly.plist<br>
launchctl load  /Library/LaunchDaemons/com.cron.monthly.plist<br>
</code></pre>

<br>
<b>Stop</b>
<pre><code>launchctl unload  /Library/LaunchDaemons/com.cron.seconds.plist<br>
launchctl unload  /Library/LaunchDaemons/com.cron.hourly.plist<br>
launchctl unload  /Library/LaunchDaemons/com.cron.daily.plist<br>
launchctl unload  /Library/LaunchDaemons/com.cron.weekly.plist<br>
launchctl unload  /Library/LaunchDaemons/com.cron.monthly.plist<br>
</code></pre>

<br>
<b>Check</b>
<pre><code>launchctl list<br>
</code></pre>