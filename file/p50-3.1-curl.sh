#!/bin/bash

REMO_ACCESS_TOKEN=****
HUE_ADDRESS=192.168.0.243
HUE_USERNAME=newdeveloper

case $1 in

  light_on)
    curl -X POST "https://api.nature.global/1/signals/2f40bc07-0ed6-460c-8bc9-84bcf99aa11c/send" -H "accept: application/json" -H "Authorization: Bearer ${REMO_ACCESS_TOKEN}"
    ;;

  light_off)
    curl -X POST "https://api.nature.global/1/signals/c8b02fb2-7b27-4ae6-a585-b11e5be52b62/send" -H "accept: application/json" -H "Authorization: Bearer ${REMO_ACCESS_TOKEN}"
    ;;

  hue_1)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true,"bri":1,"hue":13401,"sat":204}'
    ;;

  hue_2)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":true,"bri":254,"hue":13401,"sat":204}'
    ;;

  hue_off)
    curl -i "http://${HUE_ADDRESS}/api/${HUE_USERNAME}/groups/0/action" -X PUT -d '{"on":false}'
    ;;
esac
