#!/bin/sh

# cronjob
CHECK=$(ps -ax | grep -c "pentabot")
if [ "$CHECK" = "1" ]; then
killall python2.7
sleep 2
/usr/local/bin/python2.7 ./pentabot.py &
exit 0
fi

# racct violation
RACCT1=$(top -aSPjn | grep pentabot | awk '{print $12}' | sed 's/%//' | awk -F  "." '{print $1}' | head -n1)
if [ "$RACCT1" -ge "8" ]; then
killall python2.7
sleep 2
/usr/local/bin/python2.7 ./pentabot.py &
exit 0
fi

# racct violation
RACCT2=$(top -aSPjn | grep pentabot | awk '{print $9}' | sed 's/%//')
if [ "$RACCT2" = "racct" ]; then
killall python2.7
sleep 2
/usr/local/bin/python2.7 ./pentabot.py &
exit 0
fi

exit 0
#
