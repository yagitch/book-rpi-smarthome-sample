#!/usr/bin/env python3
import subprocess
import requests
from bs4 import BeautifulSoup

# 銀座四丁目バス停の車両接近情報ページを取得する
r = requests.get("https://tobus.jp/blsys/navi?VCD=cslst&ECD=NEXT&LCD=&func=fap&method=msl&syl=&slst=448&slrsp=")
s = BeautifulSoup(r.content,'html.parser')

def talk(words):
    subprocess.call(['/home/pi/auto/sound/jtalk.sh',words])

table = s.find_all('table',{"class":"appListTbl"})

# 東京駅丸の内南口行（都04系統）の接近情報を取得する
rows  = table[1].find_all('tr')
cells = rows[0].find_all('td')
words = ""
for cell in cells:
    if cell.get_text().strip():
        words += cell.get_text().replace('待', '待ちです。')
if words:
    talk(words)
else:
    talk("接近中のバスはありません")
