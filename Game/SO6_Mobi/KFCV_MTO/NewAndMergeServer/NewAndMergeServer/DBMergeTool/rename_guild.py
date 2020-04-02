# -*- coding: utf-8 -*-

import time
from MySQLdb import *

DuplicatedGuildNameTableName = "_DuplicatedGuildName"


class RenameGuild:
    def __init__(self, from_db_config, to_db_config):
        self.__from_db_config = from_db_config
        self.__to_db_config = to_db_config
        self.__suffix = ".s%d" % (self.__from_db_config["ServerID"] % 100, )

    def run(self):
        try:
            print "Starting rename guild in [%s]" % self.__from_db_config["Database"]

            cnx = Connect(host=self.__from_db_config["Host"],
                          db=self.__from_db_config["Database"],
                          user=self.__from_db_config["User"],
                          passwd=self.__from_db_config["Password"])

            self.__create_duplicated_guild_name_table(cnx)
            self.__update_guild_name(cnx)
            self.__update_guild_member_guild_name(cnx)
            self.__update_player_guild_name(cnx)

            cnx.close()
            print ""

        except MySQLError as err:
            print err
            exit(1)

    def __create_duplicated_guild_name_table(self, conn):
        print "Starting create duplicated guild name table ..."
        begin = time.time()
        cursor = conn.cursor()
        sql = ("CREATE TABLE `%s`(`Name` VARCHAR(64) NOT NULL PRIMARY KEY) Engine=InnoDB Charset='utf8' AS "
               "(SELECT %s.Guild.Name FROM %s.Guild "
               "INNER JOIN %s.Guild ON %s.Guild.Name = %s.Guild.NAME "
               "WHERE %s.Guild.ServerID = %d AND %s.Guild.ServerID = %d)" %
               (DuplicatedGuildNameTableName, self.__from_db_config["Database"], self.__from_db_config["Database"],
                self.__to_db_config["Database"], self.__from_db_config["Database"], self.__to_db_config["Database"],
                self.__from_db_config["Database"], self.__from_db_config["ServerID"],
                self.__to_db_config["Database"], self.__to_db_config["ServerID"]))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()
        print "Finished create duplicated guild name table, elapsed %d seconds, affected %d rows" % (
            end - begin, affected_rows)

    def __update_guild_name(self, conn):
        print "Starting update guild name ..."
        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.Guild SET Name = CONCAT(Name, '%s') "
               "WHERE ServerID = %d AND Name IN (SELECT Name From %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedGuildNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update guild name, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __update_guild_member_guild_name(self, conn):
        print "Starting update guild member guild name ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.GuildMember SET GuildName = CONCAT(GuildName, '%s') "
               "WHERE ServerID = %d AND GuildName IN (SELECT Name From %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedGuildNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update guild member guild name, elapsed %d seconds, affected %d rows" % (
            end - begin, affected_rows)

    def __update_player_guild_name(self, conn):
        print "Starting update player guild name ..."

        begin = time.time()
        cursor = conn.cursor()
        sql = ("UPDATE %s.Player SET GuildName = CONCAT(GuildName, '%s') "
               "WHERE ServerId = %d AND GuildName IN (SELECT Name From %s)" %
               (self.__from_db_config["Database"], self.__suffix,
                self.__from_db_config["ServerID"], DuplicatedGuildNameTableName))
        affected_rows = cursor.execute(sql)
        conn.commit()
        cursor.close()
        end = time.time()

        print "Finished update player guild name, elapsed %d seconds, affected %d rows" % (
            end - begin, affected_rows)
