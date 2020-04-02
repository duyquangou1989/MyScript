# -*- coding: utf-8 -*-
# Author:An Shen
# Email: shen.an89@gmail.com

GameTypes =[
    "AuthServerd", "PayServerd", "GMServerd",
    "as", "ps", "gm", "common",
    "BattleManagerd","BattleServerd", "GameServerd",
    "bm","bs","gs", "game"
]
Actions = ["start","stop", "status"]

# Config this only
# ServerList = {
#     "key1":"Scripts Path1",
#     "key2":"Scripts Path2"
#               }

ServerList = {
    "10001":"/home/cmge/shaolin_10001/gamestart.sh",
    "10002":"/home/cmge/shaolin_10002/gamestart.sh",
    "10003":"/home/cmge/shaolin_10003/gamestart.sh",
    "10004":"/home/cmge/shaolin_10004/gamestart.sh"
              }
