#!/bin/sh

UPT=`uptime`
echo -n Uptime:
echo "$UPT"

/home/CHIPPushover.sh "$UPT"
