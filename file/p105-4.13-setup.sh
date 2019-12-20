#!/bin/bash

AUTO_HOME=/home/pi/auto

NOW=`date +%H%M`
if [ -e ${AUTO_HOME}/night.touch -a ${NOW} -le "0700" -a ${NOW} -ge "0420" ]
then
  ${AUTO_HOME}/night.sh sunrise &
elif [ ! -e ${AUTO_HOME}/night.touch -a ${NOW} -le "1910" -a ${NOW} -ge "1620" ]
then
  ${AUTO_HOME}/night.sh sunset &
fi

sleep 20s
amixer -D bluealsa sset "LBT-SPP20 - A2DP" 50%
aplay -D bluealsa ${AUTO_HOME}/sound/start.wav