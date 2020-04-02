# -*- coding:utf-8 -*-

import time
from config import *
from filter_player import FilterPlayer
from rename_player import RenamePlayer
from rename_guild import RenameGuild
from merge import Merge
from update_db import UpdateDB


begin = time.time()
# 清理角色
filter_source_db_from = FilterPlayer(server_id=SourceDBFrom["ServerID"], 
                                     host=SourceDBFrom["Host"],
                                     db=SourceDBFrom["Database"],
                                     user=SourceDBFrom["User"],
                                     password=SourceDBFrom["Password"])
filter_source_db_from.run()

filter_source_db_to = FilterPlayer(server_id=SourceDBTo["ServerID"],
                                   host=SourceDBTo["Host"],
                                   db=SourceDBTo["Database"],
                                   user=SourceDBTo["User"],
                                   password=SourceDBTo["Password"])
filter_source_db_to.run()

# 处理玩家重名
rename_player_proc = RenamePlayer(SourceDBFrom, SourceDBTo)
rename_player_proc.run()

# 公会数据处理
rename_guild_proc = RenameGuild(SourceDBFrom, SourceDBTo)
rename_guild_proc.run()

# 合并数据
merge_proc = Merge(SourceDBFrom, SourceDBTo, TargetDB)
merge_proc.run()

# 更新数据
update_proc = UpdateDB(SourceDBFrom, TargetDB)
update_proc.run()

end = time.time()
print "Elapsed %d seconds in total." % (end - begin)
print "Merge [%s] and [%s] to [%s] succeed." % (SourceDBFrom["Database"], SourceDBTo["Database"], TargetDB["Database"])
