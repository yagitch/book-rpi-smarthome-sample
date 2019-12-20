#!/usr/bin/env python3
import subprocess
import requests
from bs4 import BeautifulSoup

# 東京都千代田区の観測局から情報を取得する
r = requests.get("http://soramame.taiki.go.jp/mobile/DataListHyou.php?MstCode=13101010")
s = BeautifulSoup(r.content,'html.parser')

def talk(words):
    subprocess.call(['/home/pi/auto/sound/jtalk.sh',words])

# 最新のPM2.5の測定値を取得する
table = s.find_all('table')
rows  = table[0].find_all('tr')
cells = rows[4].find_all('td')
latest_pm25 = cells[14].get_text()
try:
    pm25 = int(latest_pm25)
    if int(pm25) >= 36:
        talk("PM2.5に注意してください。最新の測定値は1立方メートルあたり",pm25,"マイクログラムです")
    else:
        talk("PM2.5の心配はありません")
except ValueError:
    talk("PM2.5のデータが欠測しています")