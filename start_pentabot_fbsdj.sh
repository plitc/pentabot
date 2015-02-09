#!/bin/sh

# cronjob
CHECK1=$(ps -ax | grep -c "pentabot")
if [ "$CHECK1" = "1" ]; then
   killall python2.7
   sleep 2
   /usr/local/bin/python2.7 ./pentabot.py &
   exit 0
fi

# racct violation
RACCT1=$(top -aSPjn | grep pentabot | awk '{print $12}' | sed 's/%//' | awk -F  "." '{print $1}' | head -n1)
if [ "$RACCT1" -gt "8" ]; then
   killall python2.7
   sleep 2
   /usr/local/bin/python2.7 ./pentabot.py &
   exit 0
fi

# racct violation
RACCT2=$(top -aSPjn | grep pentabot | awk '{print $9}' | sed 's/%//' | head -n1)
if [ "$RACCT2" = "racct" ]; then
   killall python2.7
   sleep 2
   /usr/local/bin/python2.7 ./pentabot.py &
   exit 0
fi

# netstat
CHECK2=$(netstat -n4 | grep "89.238.79.220.5222" | awk '{print $6}')
if [ "$CHECK2" = "ESTABLISHED" ]; then
   echo "" # dummy
else
   killall python2.7
   sleep 2
   /usr/local/bin/python2.7 ./pentabot.py &
   exit 0
fi

# wired memory
CHECK3=$(top -aSPjn | grep pentabot | awk '{print $7}' | sed 's/M//' | head -n1)
if [ "$CHECK3" -lt "99"  ]; then
   killall python2.7
   sleep 2
   /usr/local/bin/python2.7 ./pentabot.py &
   exit 0
fi

exit 0
# EOF
