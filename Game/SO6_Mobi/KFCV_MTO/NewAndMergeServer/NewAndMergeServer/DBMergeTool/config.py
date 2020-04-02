# -*- coding: utf-8 -*-

__Common = {
    "Host": "10.147.6.116",
    "User": "admin",
    "Password": "CmGamge2014QET",
}

SourceDBFrom = {
    "Database": "GameSL20008_20151204",
    "ServerID": 20008,
    "Host": __Common["Host"],
    "User": __Common["User"],
    "Password": __Common["Password"],
}

SourceDBTo = {
    "Database": "GameSL20007_20151204",
    "ServerID": 20007,
    "Host": __Common["Host"],
    "User": __Common["User"],
    "Password": __Common["Password"],
}

TargetDB = {
    "Database": "GameSL20007_20151204_Merged",
    "ServerID": SourceDBTo["ServerID"],
    "Host": __Common["Host"],
    "User": __Common["User"],
    "Password": __Common["Password"],
}