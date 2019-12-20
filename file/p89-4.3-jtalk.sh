#!/bin/bash
HV=/usr/share/hts-voice/nitech-jp-atr503-m001/nitech_jp_atr503_m001.htsvoice

tempfile=`tempfile`
option="-m $HV \
  -s 16000 \
  -p 100 \
  -a 0.03 \
  -u 0.0 \
  -jm 1.0 \
  -jf 1.0 \
  -x /var/lib/mecab/dic/open-jtalk/naist-jdic \
  -ow $tempfile"

if [ -z "$1" ] ; then
  open_jtalk $option
else
  if [ -f "$1" ] ; then
    open_jtalk $option $1
  else
    echo "$1" | open_jtalk $option
  fi
fi

aplay -q $tempfile
rm $tempfile