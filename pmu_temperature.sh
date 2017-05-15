#!/bin/bash

set -e

board=$(uname -a | cut -c7-11)
if [ $board == "chip" ]
then
   echo "C.H.I.P. detected " 
else
   echo "No C.H.I.P. detected -> Exit"
   exit
fi

# read temperature from PMU AXP202
reg=$(i2cget -f -y 0 0x34 0x5E w)

# sed clears 0x before number (0x700a => 700a)
# tr changes all to upper case ((700a => 700A)) 
# awk prints one string for bc
#
# bc calculates
# hi  = value / 0x100
# low = value % 0x10
# r   = low*0x10 + hi
#
# ibase=16 - input for bc is hex
# obase=10 - output of bc is decimal
# scale=1  - output with one digit after the decimal point

echo -n "PMU Temperature = "
echo "$reg"  | sed s/0x// | tr '[:lower:]' '[:upper:]' |  awk  '{print "obase=10;ibase=16; value=" $reg "; hi=value/100; low=(value%100); scale=1; r=((low*10+hi) -5A7)/A; print r" }' | bc
echo " C"
