#!/bin/sh

ps -ax | grep "[m]pv" | awk '{print $11}' > /tmp/mpv_current.log
sed -i '/^$/d' /tmp/mpv_current.log

# EOF
