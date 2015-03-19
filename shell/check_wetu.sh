#!/bin/sh
### ### ### C3D2 ### ### ###

TMPFILE=/tmp/pentabot_check_wetu.log
TMPFILE1=/tmp/pentabot_check_wetu1.log

# check - http: c3d2.de
WEB=$(/usr/bin/curl -m3 -I http://www.c3d2.de/ 2>&1 | grep 'HTTP/' | grep -c "OK")
if [ "$WEB" = "1" ]; then
   echo "Web=OK" > "$TMPFILE"
else
   echo "Web=FAILED" > "$TMPFILE"
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
SMTP=$(nc -vz -w 1 -t mail.c3d2.de 25 2>&1 > /dev/null | grep -c "succeeded")
if [ "$SMTP" = "1" ]; then
   echo "Mail(smtp)=OK" >> "$TMPFILE"
else
   echo "Mail(smtp)=FAILED" >> "$TMPFILE"
fi

# check - imap: mail.c3d2.de
IMAP=$(nc -vz -w 1 -t mail.c3d2.de 143 2>&1 > /dev/null | grep -c "succeeded")
if [ "$IMAP" = "1" ]; then
   echo "Mail(imap)=OK" >> "$TMPFILE"
else
   echo "Mail(imap)=FAILED" >> "$TMPFILE"
fi

# check - xmpp: jabber.c3d2.de
JABBER=$(nc -vz -w 1 -t jabber.c3d2.de 5269 2>&1 > /dev/null | grep -c "succeeded")
if [ "$JABBER" = "1" ]; then
   echo "Jabber=OK" >> "$TMPFILE"
else
   echo "Jabber=FAILED" >> "$TMPFILE"
fi

cat "$TMPFILE" | tr "\n" " " > "$TMPFILE1"

### ### ### C3D2 ### ### ###
# EOF
