#!/bin/sh
### ### ### C3D2 ### ### ###

TMPFILE=/tmp/pentabot_check_wetu.log
TMPFILE1=/tmp/pentabot_check_wetu1.log
TMPFILE2=/tmp/pentabot_check_wetu2.log

# check - dns: ns.c3d2.de
DNS=$(nc -vz -w 2 -t ns.c3d2.de 53 2>&1 > /dev/null | grep -c "succeeded")
if [ "$DNS" = "1" ]; then
   echo "Dns(tcp)=OK" > "$TMPFILE"
else
   echo "Dns(tcp)=FAILED" > "$TMPFILE"
fi

# check - http: c3d2.de
WEB=$(/usr/bin/curl -m3 -I http://www.c3d2.de/ 2>&1 | grep 'HTTP/' | grep -c "OK")
if [ "$WEB" = "1" ]; then
   echo "Web=OK" >> "$TMPFILE"
else
   echo "Web=FAILED" >> "$TMPFILE"
fi

# check - https: wiki.c3d2.de
WIKI=$(/usr/bin/curl --insecure -m3 -I https://wiki.c3d2.de/Hauptseite 2>&1 | grep 'HTTP/' | grep -c "OK")
if [ "$WIKI" = "1" ]; then
   echo "Wiki=OK" >> "$TMPFILE"
else
   echo "Wiki=FAILED" >> "$TMPFILE"
fi

# check - https: redmine.c3d2.de
REDMINE=$(/usr/bin/curl --insecure -m3 -I https://redmine.c3d2.de/login.php 2>&1 | grep 'HTTP/' | grep -c "OK")
if [ "$REDMINE" = "1" ]; then
   echo "Redmine=OK" >> "$TMPFILE"
else
   echo "Redmine=FAILED" >> "$TMPFILE"
fi

# check - https: pentapad.c3d2.de
PENTAPAD=$(/usr/bin/curl --insecure -m3 -I https://pentapad.c3d2.de/ 2>&1 | grep 'HTTP/' | grep -c "OK")
if [ "$PENTAPAD" = "1" ]; then
   echo "Pentapad=OK" >> "$TMPFILE"
else
   echo "Pentapad=FAILED" >> "$TMPFILE"
fi

# check - smtp: mail.c3d2.de
SMTP=$(nc -vz -w 2 -t mail.c3d2.de 25 2>&1 > /dev/null | grep -c "succeeded")
if [ "$SMTP" = "1" ]; then
   echo "Mail(smtp)=OK" >> "$TMPFILE"
else
   echo "Mail(smtp)=FAILED" >> "$TMPFILE"
fi

# check - imap: mail.c3d2.de
IMAP=$(nc -vz -w 2 -t mail.c3d2.de 143 2>&1 > /dev/null | grep -c "succeeded")
if [ "$IMAP" = "1" ]; then
   echo "Mail(imap)=OK" >> "$TMPFILE"
else
   echo "Mail(imap)=FAILED" >> "$TMPFILE"
fi

# check - xmpp: jabber.c3d2.de
JABBER=$(nc -vz -w 2 -t jabber.c3d2.de 5269 2>&1 > /dev/null | grep -c "succeeded")
if [ "$JABBER" = "1" ]; then
   echo "Jabber=OK" >> "$TMPFILE"
else
   echo "Jabber=FAILED" >> "$TMPFILE"
fi

### ### ### ### ### ### ### ### ###

grep "FAILED" "$TMPFILE" > "$TMPFILE1"

cat "$TMPFILE1" | tr "\n" " " > "$TMPFILE2"

CHECKTMPFILE2=$(cat /tmp/pentabot_check_wetu2.log)
if [ -z "$CHECKTMPFILE2" ]; then
   echo "WETU health status = OK" > /tmp/pentabot_check_wetu2.log
fi

### ### ### C3D2 ### ### ###
# EOF
