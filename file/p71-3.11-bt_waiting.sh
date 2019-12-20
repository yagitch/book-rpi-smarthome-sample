#!/bin/bash

AUTO_HOME=/home/pi/auto
DEVNAME=devicename
DEVID=XX:XX:XX:XX:XX:XX

#不在の時だけ繰り返し実行
while [ ! -e ${AUTO_HOME}/home.touch ]
do
  RESULT=`hcitool name ${DEVID}`
  if [ "${RESULT}" = "${DEVNAME}" ]
  then
    #BTデバイスが存在する場合はbt.touchが存在しない状態にする
    if [ -e ${AUTO_HOME}/bt.touch ]
    then
      #bt.touchが30分以上前に作られている場合は帰宅と判定
      TIMESTAMP=`date -r ${AUTO_HOME}/bt.touch "+%Y%m%d%H%M%S"`
      NMINAGO=`date --date "30 min ago" "+%Y%m%d%H%M%S"`
      if [ ${TIMESTAMP} -le ${NMINAGO} ]
      then
        ${AUTO_HOME}/home.sh &
        # BTデバイス検出有り。帰宅と判定しました
      else
        :
        # BTデバイス検出有り。外出前と推測します(bt.touch作成済)
      fi
    else
      :
      # BTデバイス検出有り。外出前と推測します(bt.touch未作成)
    fi
  else
    #BTが存在しない場合はbt.touchが存在する状態にする
    if [ ! -e ${AUTO_HOME}/bt.touch ]
    then
      touch ${AUTO_HOME}/bt.touch
      # BTデバイス検出なし。bt.touchを作成しました
    else
      :
      # BTデバイス検出なし。bt.touchは既にあります
    fi
  fi
  sleep 10s
done

#bt.touchは削除する
rm ${AUTO_HOME}/bt.touch