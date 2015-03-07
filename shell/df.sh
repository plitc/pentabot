#!/bin/sh

df -h | grep "disk" | awk '{print $2}'

# EOF
