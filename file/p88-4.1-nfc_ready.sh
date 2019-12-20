#!/bin/bash

while :
do
  RESULT=`/home/pi/nfcpy/examples/tagtool.py`
  case $RESULT in
  *0454FCXXXXXXXX*)
    mpg321 /home/pi/auto/sound/test.mp3
    sleep 5s
    ;;
  esac
done