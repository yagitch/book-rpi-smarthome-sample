#!/bin/bash

AUTO_HOME=/home/pi/auto

if [ -e ${AUTO_HOME}/home.touch ]
then

  #在宅状態なら不在状態に変える
  rm ${AUTO_HOME}/home.touch

  #照明を消す
  ${AUTO_HOME}/curl.sh "light_off"
  ${AUTO_HOME}/curl.sh "hue_off"

  #動作確認音を出す
  mpg321 ${AUTO_HOME}/sound/sp2.mp3

else

  #不在状態なら在宅状態に変える
  touch ${AUTO_HOME}/home.touch

  #照明を点ける
  NOW=`date +"%H%M"`
  if test ${NOW} -ge 0420 -a ${NOW} -lt 2100
  then
    ${AUTO_HOME}/curl.sh "light_on"
  else
    ${AUTO_HOME}/curl.sh "hue_on"
  fi

  #動作確認音を出す
  mpg321 ${AUTO_HOME}/sound/sp1.mp3

fi