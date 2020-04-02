# -*- coding: utf-8 -*-
# Author:An Shen
# Email: shen.an89@gmail.com

import subprocess

class Crontrol(object):
    def __init__(self,Path,GameType,Action):
        self.Path = Path
        self.GameType = GameType
        self.Action = Action

    def run(self):
        command = "%s %s %s" %(
            self.Path,self.GameType, self.Action
        )
        self.__execution(command=command)

    def __execution(self,command):
         result = subprocess.call(command, shell=True)
         if result != 0:
              print("Some errors.")
              exit(1)