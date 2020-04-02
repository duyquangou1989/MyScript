# -*- coding: utf-8 -*-

import time
from MySQLdb import *


class FilterPlayer:

    def __init__(self, server_id, host, db, user, password):
        self.__serverId = server_id
        self.__host = host
        self.__db = db
        self.__user = user
        self.__password = password

    def run(self):
        try:
            print "Starting filter [%s]" % self.__db
            cnx = Connect(host=self.__host, db=self.__db, user=self.__user, passwd=self.__password)

            self.__filter_player(cnx)
            self.__filter_friends(cnx)
            self.__filter_guild_members(cnx)
            self.__filter_buy_num(cnx)
            self.__filter_item(cnx)
            self.__filter_mails(cnx)
            self.__filter_mails_del(cnx)
            self.__filter_pet(cnx)
            self.__filter_role(cnx)

            cnx.close()
            print ""
        except MySQLError as err:
            print err
            exit(1)

    def __filter_player(self, conn):
        # 删除Vip等级为0且连续8天没有登录的玩家
        print "Starting filter players ..."

        begin = time.time()
        cursor = conn.cursor()

        sql = ("DELETE FROM Player WHERE VipLevel <= 0 "
               "AND ABS(LogoutTime - UNIX_TIMESTAMP()) >= 8 * 24 * 3600 AND Level <= 15 AND ServerID = %s")
        affected_rows = cursor.execute(sql, (self.__serverId,))

        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter players, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __filter_friends(self, conn):
        # 删除好友表中有无效玩家的记录
        print "Starting filter friends ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("DELETE FROM Friend WHERE (PlayerName NOT IN (SELECT Name FROM Player)"
                         "OR FriendName NOT IN (SELECT Name FROM Player)) ")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter friends, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __filter_guild_members(self, conn):
        # 删除公会成员表中有无效玩家的记录
        print "Starting filter guild members ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("DELETE FROM GuildMember WHERE Name NOT IN (SELECT Name FROM Player)")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter guild members, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __filter_buy_num(self, conn):
        # 删除BuyNum表中无效的玩家的记录
        print "Starting filter buy num ..."

        begin = time.time()

        cursor = conn.cursor()
        sql = ("DELETE FROM BuyNum WHERE UUID NOT IN (SELECT UUID FROM Player)")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter buy num, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __filter_item(self, conn):
        # 删除Item表中的无效的玩家的记录
        print "Starting filter item ..."
        begin = time.time()
        cursor = conn.cursor()
        sql = ("DELETE FROM Item WHERE PlayerUUID NOT IN (SELECT UUID FROM Player)")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter item, elapsed %d seconds, afftected %d rows" % (end - begin, affected_rows)

    def __filter_mails(self, conn):
        # 删除Mails表中的无效的玩家的记录
        print "Starting filter mails ..."
        begin = time.time()
        cursor = conn.cursor()
        sql = ("DELETE FROM Mails WHERE RecverUUID NOT IN (SELECT UUID FROM Player)")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter mails, elapsed %d seconds, afftected %d rows" % (end - begin, affected_rows)

    def __filter_mails_del(self, conn):
        # 删除Mails_DEL表中的无效的玩家的记录
        print "Starting filter mails del ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("DELETE FROM Mails_DEL WHERE RecverUUID NOT IN (SELECT UUID FROM Player)")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter mails del, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __filter_pet(self, conn):
        # 删除Pet表中无效的玩家的记录
        print "Starting filter pet ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("DELETE FROM Pet WHERE PlayerUUID NOT IN (SELECT UUID From Player)")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter pet, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __filter_role(self, conn):
        # 删除Role表中的无效的玩家的记录
        print "Starting filter role ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("DELETE FROM Role WHERE PlayerUUID NOT IN (SELECT UUID From Player)")
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished filter role, elapsed %d seconds, afftected %d rows" % (end - begin, affected_rows)