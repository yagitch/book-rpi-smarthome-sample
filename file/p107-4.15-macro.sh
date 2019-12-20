#!/bin/bash

AUTO_HOME=/home/pi/auto

case $1 in

  light1)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      ${AUTO_HOME}/curl.sh hue_1
      ${AUTO_HOME}/curl.sh light_off
    fi
    ;;

  light2)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      ${AUTO_HOME}/curl.sh hue_2
      ${AUTO_HOME}/curl.sh light_off
    fi
    ;;

  light3)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      ${AUTO_HOME}/curl.sh light_on
      ${AUTO_HOME}/curl.sh hue_off
    fi
    ;;

  light_off)
    ${AUTO_HOME}/curl.sh light_off
    ${AUTO_HOME}/curl.sh hue_off
    ;;

  shutdown)
    aplay ${AUTO_HOME}/sound/shutdown.wav
    sudo shutdown -h now
    ;;

  alexa_nhk)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      COMMAND="アレクサ、NHKラジオ第一東京をかけて"
      ${AUTO_HOME}/sound/jtalk.sh "${COMMAND}"
    fi
    ;;

  weather)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      TEMPERTURE=`${AUTO_HOME}/netatmo/get.sh`
      ${AUTO_HOME}/sound/jtalk.sh "${TEMPERTURE}"
    fi
    ;;

  nhkr1_on)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      ${AUTO_HOME}/radio.sh nhkr1
    fi
    ;;

  ajazz_on)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      ${AUTO_HOME}/radio.sh ajazz
    fi
    ;;

  relax_on)
    if [ -e ${AUTO_HOME}/home.touch ]
    then
      ${AUTO_HOME}/radio.sh relax
    fi
    ;;

  radio_off)
    pkill -f mplayer
    ;;

esac