#!/bin/sh

### ### ### PLITC ### ### ###
/sbin/ping6 -q -c5 zzz > /dev/null

if [ $? -eq 0 ];
then
   echo "is in da House"
else
   echo "ausgeflogen"
fi

### ### ### PLITC ### ### ###
# EOF
