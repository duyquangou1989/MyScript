#!/usr/bin/python
# -*- coding: utf-8 -*-
# Author:An Shen
# Email: shen.an89@gmail.com

import sys
from control import Crontrol
from config import *



InputSvr = sys.argv[1:]

TargetSvr = InputSvr[0:-2]
Action = InputSvr[-1]
GameType = InputSvr[-2]

# check Parameter
if len(InputSvr) < 3:
    print("Parameter error!")
    exit(1)
if GameType not in GameTypes:
    print("Parameter error!")
    exit(1)
if Action not in Actions:
    print("Parameter error!")
    exit(1)

def run(SvrList,GameType,Action):
    command = Crontrol(Path=ServerList[x],GameType=GameType,Action=Action)
    command.run()

if TargetSvr[0] == "all":
    for x in ServerList:
        run(SvrList=ServerList[x],GameType=GameType,Action=Action)
else:
    for x in TargetSvr:
        run(SvrList=ServerList[x],GameType=GameType,Action=Action)

