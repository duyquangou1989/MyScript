# -*- coding: utf-8 -*-

import time
from MySQLdb import *


class UpdateDB:
    def __init__(self, from_db_config, target_db_config):
        self.__from_db_config = from_db_config
        self.__target_db_config = target_db_config

    def run(self):
        try:
            print "Starting update target db ..."
            cnx = Connect(host=self.__target_db_config["Host"],
                          db=self.__target_db_config["Database"],
                          user=self.__target_db_config["User"],
                          passwd=self.__target_db_config["Password"])
            self.__update_player(cnx)
            self.__update_friend(cnx)
            self.__update_guild(cnx)
            self.__update_guild_member(cnx)
            self.__update_mails(cnx)
            self.__update_mails_del(cnx)
            self.__update_guild_battle(cnx)
            self.__update_player_arena_point(cnx)
            cnx.close()
            print ""
        except MySQLError as err:
            print err
            exit(1)

    def __update_player(self, conn):
        print "Starting update player ... "

        begin = time.time()
        cursor = conn.cursor()

        sql = ("UPDATE Player SET ServerID = %s WHERE ServerID = %s")
        affected_rows = cursor.execute(sql, (self.__target_db_config["ServerID"],
                                             self.__from_db_config["ServerID"]))

        conn.commit()
        cursor.close()
        end = time.time()
        print "Finished update player, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_friend(self, conn):
        print "Starting update friend ... "

        begin = time.time()
        cursor = conn.cursor()

        sql = ("UPDATE Friend SET ServerID = %s WHERE ServerID = %s")
        affected_rows = cursor.execute(sql, (self.__target_db_config["ServerID"],
                                             self.__from_db_config["ServerID"]))

        conn.commit()
        cursor.close()
        end = time.time()
        print "Finished update friend, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_guild(self, conn):
        print "Starting update guild ... "

        begin = time.time()
        cursor = conn.cursor()

        sql = ("UPDATE Guild SET ServerID = %s WHERE ServerID = %s")
        affected_rows = cursor.execute(sql, (self.__target_db_config["ServerID"],
                                             self.__from_db_config["ServerID"]))
        conn.commit()
        cursor.close()
        end = time.time()
        print "Finished update guild, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_guild_member(self, conn):
        print "Starting update guild member ... "

        begin = time.time()
        cursor = conn.cursor()

        sql = ("UPDATE GuildMember SET ServerID = %s WHERE ServerID = %s")
        affected_rows = cursor.execute(sql, (self.__target_db_config["ServerID"],
                                             self.__from_db_config["ServerID"]))
        conn.commit()
        cursor.close()
        end = time.time()
        print "Finished update guild member, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_mails(self, conn):
        print "Starting update mails ... "

        begin = time.time()
        cursor = conn.cursor()

        sql = ("UPDATE Mails SET ServerID = %s WHERE ServerID = %s")
        affected_rows = cursor.execute(sql, (self.__target_db_config["ServerID"],
                                             self.__from_db_config["ServerID"]))

        conn.commit()
        cursor.close()
        end = time.time()
        print "Finished update mails, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_mails_del(self, conn):
        print "Starting update mails del ... "

        begin = time.time()
        cursor = conn.cursor()

        sql = ("UPDATE Mails_DEL SET ServerID = %s WHERE ServerID = %s")
        affected_rows = cursor.execute(sql, (self.__target_db_config["ServerID"],
                                             self.__from_db_config["ServerID"]))

        conn.commit()
        cursor.close()
        end = time.time()
        print "Finished update mails del, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_guild_battle(self, conn):
        print "Starting update guild battle ... "

        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE Guild SET Battle = Battle + BattleAuc")
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("UPDATE Guild SET BattleAuc = 0")
        affected_rows2 = cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished update guild battle, elapsed %d seconds, affected %d, %d rows" % (
            end - begin, affected_rows, affected_rows2)

    def __update_player_arena_point(self, conn):
        print "Starting update player arena point ..."

        begin = time.time()
        cursor = conn.cursor()

        sql = ("UPDATE Player SET ArenaPoint = 10")
        affected_rows = cursor.execute(sql)

        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update player arena point, elapsed %d seconds, affected %d rows" % (
            end - begin, affected_rows)
