#!/bin/sh
### ### ### C3D2 ### ### ###

# function: bot_restart
bot_restart(){
   killall python; pkill python
   ps -ax | grep "[python] ./pentabot.py" | awk '{print $1}' | xargs -L1 kill -9
   sleep 2
   /usr/bin/python ./pentabot.py &
}

CHECK1=$(ps -ax | grep -c "[python] ./pentabot.py")
if [ "$CHECK1" -lt "1" -o "$CHECK1" -gt "1" ]; then
   bot_restart
fi

exit 0
### ### ### C3D2 ### ### ###
# EOF
