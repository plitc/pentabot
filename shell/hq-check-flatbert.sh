#!/bin/sh

### ### ### PLITC ### ### ###
/sbin/ping6 -q -c5 flatbert.hq.c3d2.de > /dev/null

if [ $? -eq 0 ];
then
   echo "... mir geht es gut ..."
else
   echo "Hilfe! Bauchschmerzen ..."
fi

### ### ### PLITC ### ### ###
# EOF
