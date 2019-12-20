#!/bin/bash

AUTO_HOME=/home/pi/auto

sleep 20s
amixer -D bluealsa sset "LBT-SPP20 - A2DP" 50%
aplay -D bluealsa ${AUTO_HOME}/sound/start.wav