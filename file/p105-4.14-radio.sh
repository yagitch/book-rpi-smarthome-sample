#!/bin/bash

pkill -f mplayer

case $1 in

nhkr1)
  URL="http://nhkradioakr1-i.akamaihd.net/hls/live/511633/1-r1/1-r1-01.m3u8"
  ;;

ajazz)
  URL="http://94.23.201.38:8020/;"
  ;;

relax)
  URL="http://philae.shoutca.st:9019/stream"
  ;;

esac

mplayer -really-quiet -quiet ${URL} &