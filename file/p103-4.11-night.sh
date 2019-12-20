#!/bin/bash

AUTO_HOME=/home/pi/auto
FILENAME=/home/pi/auto/sound/bell.mp3
MAC_ADDRESS=XX:XX:XX:XX:XX:XX
LATITUDE=35.685179
LONGITUDE=139.750610

YYYY=`date +%Y`
MM=`date +%m`
DD=`date +%d`

case $1 in

#夕方(1620-1910)
sunset)
  SUNSET=`curl "http://labs.bitmeister.jp/ohakon/api/?mode=sun_rise_set&year=${YYYY}&month=${MM}&day=${DD}&lat=${LATITUDE}&lng=${LONGITUDE}" | grep sunset_hm | cut -c 12-16 | sed -e s/://`

  while [ ! -e ${AUTO_HOME}/night.touch ]
  do
    NOW=`date +%H%M`
    if [ ${SUNSET} -le ${NOW} ]
    then
      touch ${AUTO_HOME}/night.touch
      mpg321 ${FILENAME}
    else
      :
    fi
    sleep 1m
  done
  ;;

#朝方(0420-0655)
sunrise)
  SUNRISE=`curl "http://labs.bitmeister.jp/ohakon/api/?mode=sun_rise_set&year=${YYYY}&month=${MM}&day=${DD}&lat=${LATITUDE}&lng=${LONGITUDE}" | grep sunrise_hm | cut -c 13-16 | sed -e s/:// -e s/^/0/`

  while [ -e ${AUTO_HOME}/night.touch ]
  do
    NOW=`date +%H%M`
    if [ ${SUNRISE} -le ${NOW} ]
    then
      rm ${AUTO_HOME}/night.touch
      mpg321 ${FILENAME}
      sudo python switchbot.py ${MAC_ADDRESS} Press
    else
      :
    fi
    sleep 1m
  done
  ;;

esac