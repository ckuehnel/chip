#!/bin/bash

echo "Set CPU frequency to Ondemand"

echo ondemand >  /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo -n "CPU Frequency = "
cat /sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq

