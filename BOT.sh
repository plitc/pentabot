#!/bin/sh
### ### ### C3D2 ### ### ###

# function: bot_restart
bot_restart(){
   killall python; pkill python
   ps -ax | grep "[python] ./pentabot.py" | awk '{print $1}' | xargs -L1 kill -9
   sleep 2
   /usr/bin/python ./pentabot.py &
   sleep 2
   #/ lsof | grep "jabber.c3d2.de" | awk '{print $6}' > /tmp/pentabot.log
   exit 0
}

# process control
CHECK1=$(ps -ax | grep -c "[python] ./pentabot.py")

if [ "$CHECK1" -lt "1" -o "$CHECK1" -gt "1" ]; then
   bot_restart
fi

# ressource violation
CHECK2=$(top -n 1 | grep pentabot | awk '{print $10}' | cut -d, -f1)

if [ "$CHECK2" -gt "25" ]; then
   bot_restart
fi

# traffic flow control
#/ CHECK3=$(cat /tmp/pentabot.log)
#/ CHECK4=$(lsof | grep "jabber.c3d2.de" | awk '{print $6}')
#/ 
#/ if [ X"$CHECK3" = X"$CHECK4" ]; then
#/    bot_restart
#/ fi

# last/current flow
#/ lsof | grep "jabber.c3d2.de" | awk '{print $6}' > /tmp/pentabot.log

# conntrack control
# (need permissions "chmod 0444 /proc/net/ip_conntrack"
CHECK5=$(cat /proc/net/ip_conntrack | grep "89.238.79.220" | grep "5222" | awk '{print $4}')
if [ "$CHECK5" != "ESTABLISHED" ]; then
   bot_restart
fi

exit 0
### ### ### C3D2 ### ### ###
# EOF
