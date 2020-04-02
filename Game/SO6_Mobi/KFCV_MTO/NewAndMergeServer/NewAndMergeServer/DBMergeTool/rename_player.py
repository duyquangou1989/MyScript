# -*- coding: utf-8 -*-

import time
from MySQLdb import *

DuplicatedPlayerNameTableName = "_DuplicatedPlayerName"


class RenamePlayer:
    def __init__(self, from_db_config, to_db_config):
        self.__from_db_config = from_db_config
        self.__to_db_config = to_db_config
        self.__suffix = ".s%d" % (self.__from_db_config["ServerID"] % 100,)

    def run(self):
        try:
            print "Starting rename player in [%s]" % self.__from_db_config["Database"]

            cnx = Connect(host=self.__from_db_config["Host"],
                          db=self.__from_db_config["Database"],
                          user=self.__from_db_config["User"],
                          passwd=self.__from_db_config["Password"])

            self.__create_duplicated_player_name_table(cnx)
            self.__update_player_name(cnx)
            self.__update_friend_player_name(cnx)
            self.__update_friend_friend_name(cnx)
            self.__update_guild_master(cnx)
            self.__update_guild_member(cnx)
            self.__update_mails_receiver_name(cnx)
            self.__update_mails_del_receiver_name(cnx)

            cnx.close()
            print ""

        except MySQLError as err:
            print err
            exit(1)

    def __create_duplicated_player_name_table(self, conn):
        print "Starting create duplicated player name table ..."

        begin = time.time()
        cursor = conn.cursor()

        sql = ("CREATE TABLE `%s`("
               "`UUID` VARCHAR(64) NOT NULL PRIMARY KEY,"
               "`Name` VARCHAR(64) NOT NULL,"
               "INDEX `_index_name` USING BTREE (`Name`)) Engine=InnoDB Charset='utf8' AS "
               "(SELECT %s.Player.UUID, %s.Player.Name FROM %s.Player "
               "INNER JOIN %s.Player ON %s.Player.Name = %s.Player.Name "
               "WHERE %s.Player.ServerID = %d AND %s.Player.ServerID = %d)"
               % (DuplicatedPlayerNameTableName,
                  self.__from_db_config["Database"], self.__from_db_config["Database"], self.__from_db_config["Database"],
                  self.__to_db_config["Database"], self.__from_db_config["Database"], self.__to_db_config["Database"],
                  self.__from_db_config["Database"], self.__from_db_config["ServerID"],
                  self.__to_db_config["Database"], self.__to_db_config["ServerID"]))

        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished create duplicated player name, elapsed %d seconds, " \
              "affected %d rows" % (end - begin, affected_rows)

    def __update_player_name(self, conn):
        print "Starting update player name ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.Player SET NAME = CONCAT(Name, '%s') "
               "WHERE ServerID = %d AND UUID IN (SELECT UUID FROM %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedPlayerNameTableName))
        affected_rows = cursor.execute(sql)

        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update player name, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_friend_player_name(self, conn):
        print "Starting update friend player name ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.Friend SET PlayerName = CONCAT(PlayerName, '%s') "
               "WHERE ServerID = %d AND PlayerName IN (SELECT Name From %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedPlayerNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update friend player name, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_friend_friend_name(self, conn):
        print "Starting update friend friend name ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.Friend SET FriendName = CONCAT(FriendName, '%s') "
               "WHERE ServerID = %d AND FriendName IN (SELECT Name From %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedPlayerNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update friend friend name, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_guild_master(self, conn):
        print "Starting update guild master name ..."
        begin = time.time()

        cursor = conn.cursor()
        sql = ("UPDATE %s.Guild SET Master = CONCAT(Master, '%s') "
               "WHERE ServerId = %d AND Master IN (SELECT Name FROM %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedPlayerNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update guild master name, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_guild_member(self, conn):
        print "Starting update guild member ..."
        begin = time.time()

        cursor = conn.cursor()
        sql = ("UPDATE %s.GuildMember SET Name = CONCAT(Name, '%s') "
               "WHERE ServerId = %d AND Name IN (SELECT Name FROM %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedPlayerNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update guild member, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_mails_receiver_name(self, conn):
        print "Starting update mails receiver name ..."
        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.Mails SET RecverName = CONCAT(RecverName, '%s') "
               "WHERE ServerID = %d AND RecverName IN (SELECT Name FROM %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedPlayerNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update mails receiver name, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_mails_del_receiver_name(self, conn):
        print "Starting update mails del receiver name ..."
        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.Mails_DEL SET RecverName = CONCAT(RecverName, '%s') "
               "WHERE ServerID = %d AND RecverName IN (SELECT Name FROM %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedPlayerNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update mails del receiver name, " \
              "elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)
