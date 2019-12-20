#!/bin/bash

AUTO_HOME=/home/pi/auto

case $1 in

  light1)
    ${AUTO_HOME}/curl.sh hue_1
    ${AUTO_HOME}/curl.sh light_off
    ;;

  light2)
    ${AUTO_HOME}/curl.sh hue_2
    ${AUTO_HOME}/curl.sh light_off
    ;;

  light3)
    ${AUTO_HOME}/curl.sh light_on
    ${AUTO_HOME}/curl.sh hue_off
    ;;

  light_off)
    ${AUTO_HOME}/curl.sh light_off
    ${AUTO_HOME}/curl.sh hue_off
    ;;

  shutdown)
    aplay ${AUTO_HOME}/sound/shutdown.wav
    sudo shutdown -h now
    ;;

esac