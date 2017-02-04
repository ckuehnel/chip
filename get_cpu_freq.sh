#!/bin/bash

i=0 # there is one CPU on UDOO NEO only

echo "Get CPU frequency of C.H.I.P"

echo -n "CPU0 Frequency = "
cat /sys/devices/system/cpu/cpu$i/cpufreq/cpuinfo_cur_freq
