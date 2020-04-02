# -*- coding: utf-8 -*-

import time
from MySQLdb import *


class Merge:
    def __init__(self, from_db_config, to_db_config, target_db_config):
        self.__from_db_config = from_db_config
        self.__to_db_config = to_db_config
        self.__target_db_config = target_db_config

    def run(self):
        try:
            print "Starting merge source DB to target ... "
            cnx = Connect(host=self.__target_db_config["Host"],
                          db=self.__target_db_config["Database"],
                          user=self.__target_db_config["User"],
                          passwd=self.__target_db_config["Password"])

            self.__merge_player(cnx)
            self.__merge_buy_num(cnx)
            self.__merge_friend(cnx)
            self.__merge_guild(cnx)
            self.__merge_guild_member(cnx)
            self.__merge_item(cnx)
            self.__merge_mails(cnx)
            self.__merge_mails_del(cnx)
            self.__merge_pet(cnx)
            self.__merge_role(cnx)

            cnx.close()
            print ""
        except MySQLError as err:
            print err
            exit(1)

    def __merge_player(self, conn):
        print "Starting merge player ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Player SELECT * FROM %s.Player WHERE %s.Player.ServerID = %d" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"],
                self.__to_db_config["Database"], self.__to_db_config["ServerID"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Player SELECT * FROM %s.Player WHERE %s.Player.ServerID = %d" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"],
                self.__from_db_config["Database"], self.__from_db_config["ServerID"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge player, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_buy_num(self, conn):
        print "Starting merge buy num ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.BuyNum SELECT * FROM %s.BuyNum" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.BuyNum SELECT * FROM %s.BuyNum" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge buy num, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_friend(self, conn):
        print "Starting merge friend ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Friend SELECT * FROM %s.Friend WHERE %s.Friend.ServerID = %d" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"],
                self.__to_db_config["Database"], self.__to_db_config["ServerID"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Friend SELECT * FROM %s.Friend WHERE %s.Friend.ServerID = %d" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"],
                self.__from_db_config["Database"], self.__from_db_config["ServerID"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge friend, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_guild(self, conn):
        print "Starting merge guild ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Guild SELECT * FROM %s.Guild WHERE %s.Guild.ServerID = %d" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"],
                self.__to_db_config["Database"], self.__to_db_config["ServerID"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Guild SELECT * FROM %s.Guild WHERE %s.Guild.ServerID = %d" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"],
                self.__from_db_config["Database"], self.__from_db_config["ServerID"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge guild, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_guild_member(self, conn):
        print "Starting merge guild member ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.GuildMember SELECT * FROM %s.GuildMember WHERE %s.GuildMember.ServerID = %d" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"],
                self.__to_db_config["Database"], self.__to_db_config["ServerID"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.GuildMember SELECT * FROM %s.GuildMember WHERE %s.GuildMember.ServerID = %d" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"],
                self.__from_db_config["Database"], self.__from_db_config["ServerID"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge guild member, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_item(self, conn):
        print "Starting merge item..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Item SELECT * FROM %s.Item" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Item SELECT * FROM %s.Item" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge item, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_mails(self, conn):
        print "Starting merge mails ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Mails SELECT * FROM %s.Mails WHERE %s.Mails.ServerID = %d" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"],
                self.__to_db_config["Database"], self.__to_db_config["ServerID"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Mails SELECT * FROM %s.Mails WHERE %s.Mails.ServerID = %d" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"],
                self.__from_db_config["Database"], self.__from_db_config["ServerID"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge mails, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_mails_del(self, conn):
        print "Starting merge mails del ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Mails_DEL SELECT * FROM %s.Mails_DEL WHERE %s.Mails_DEL.ServerID = %d" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"],
                self.__to_db_config["Database"], self.__to_db_config["ServerID"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Mails_DEL SELECT * FROM %s.Mails_DEL WHERE %s.Mails_DEL.ServerID = %d" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"],
                self.__from_db_config["Database"], self.__from_db_config["ServerID"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge mails del, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_pet(self, conn):
        print "Starting merge pet ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Pet SELECT * FROM %s.Pet" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Pet SELECT * FROM %s.Pet" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge pet, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)

    def __merge_role(self, conn):
        print "Starting merge role ..."
        begin = time.time()

        cursor = conn.cursor()

        sql = ("INSERT INTO %s.Role SELECT * FROM %s.Role" %
               (self.__target_db_config["Database"], self.__to_db_config["Database"]))
        affected_rows = cursor.execute(sql)
        conn.commit()

        sql = ("INSERT INTO %s.Role SELECT * FROM %s.Role" %
               (self.__target_db_config["Database"], self.__from_db_config["Database"]))
        affected_rows = affected_rows + cursor.execute(sql)
        conn.commit()

        cursor.close()
        end = time.time()
        print "Finished merge role, elapsed %d seconds, affected %d rows" % (end - begin, affected_rows)
