#!/bin/sh

### ### ### PLITC ### ### ###
/sbin/ping6 -q -c5 vater.space.c3d2.de > /dev/null

if [ $? -eq 0 ];
then
   echo "is in da House"
else
   echo "ausgeflogen"
fi

### ### ### PLITC ### ### ###
# EOF
