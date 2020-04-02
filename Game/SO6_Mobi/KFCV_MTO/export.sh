mysql -u<1> -p<2> -h<3> -e "select Account, ServerID, Name, GoldMoney, now() as ExportTime from <4>.Player;" >> <5>
# <1> => User
# <2> => Password
# <3> => HostName/IP
# <4> => DBName
# <5> => Path + Filename