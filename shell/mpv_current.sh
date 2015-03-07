#!/bin/sh
### ### ###
#/ ps -ax | grep "[m]pv" | awk '{print $7,$11}' > /tmp/mpv_current.log
ps -ax | grep "cider" | awk '{print $7,$11}' > /tmp/mpv_current.log
ps -ax | grep "zaubert" | awk '{print $7,$11}' >> /tmp/mpv_current.log
sed -i 's/.hq.c3d2.de//g' /tmp/mpv_current.log
sed -i '/^$/d' /tmp/mpv_current.log
### ### ###
# EOF
