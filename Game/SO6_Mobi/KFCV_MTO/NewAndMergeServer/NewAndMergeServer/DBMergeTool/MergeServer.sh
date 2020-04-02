#!/bin/bash

# Reserved game server ServerID
Keep_Serverid="40001"

# Reserved service database information, database combined service is generally created after this server.

Keep_DB_IP="127.0.0.1"
Keep_DB_Port="3306"
Keep_DB_User="keep-admin"
Keep_DB_Passwd="Keep-Password"
Keep_DB_Name="Keep-dbname"

# Be merged server ServerID
Merged_Serverid="40002"

# Be merged database information service

Merged_DB_IP="127.0.0.1"
Merged_DB_Port="3306"
Merged_DB_User="Merged-admin"
Merged_DB_Passwd="Merged-pwd"
Merged_DB_Name="Game_Data_00B"

# The temporary use of the database.
Temp_DB_IP="127.0.0.1"
Temp_DB_Port="3306"
Temp_DB_User="root"
Temp_DB_Passwd="123456"


DB_Backup_Dir="/data/DBBackup"
DBMergeTool_Dir="/data/DBMergeTool"
backup_date=`date "+%Y%m%d"`
SQL_dir="/home/cmge/shaolin/SQL"


if [[ ! -d "$DB_Backup_Dir" ]]; then
    mkdir ${DB_Backup_Dir} -p
fi

cd $DB_Backup_Dir
echo "Switch to: `pwd`"

Dump_Database(){
    
    if [[ "$#" != "6" ]]; then
        echo "Dump_Database: Parameter error !"
        exit 1
    fi

    db_user="$1"
    db_host="$2"
    db_port="$3"
    db_passwd="$4"
    db_name="$5"
    db_file="$6"

    echo -e "\nNow back up $db_name ... "
    
    mysqldump -u "$db_user" -h "$db_host" -P"$db_port" -p"$db_passwd" "$db_name" > "${db_file}"
}

Create_Database(){

    if [[ "$#" != "5" ]]; then
        echo "Create_Database: Parameter error !"
        exit 1
    fi

    db_user="$1"
    db_host="$2"
    db_port="$3"
    db_passwd="$4"
    db_name="$5"
    #db_file="$6"

    echo -e "\nCreate database: ${db_name} "
    
    mysql -u "$db_user" -h "$db_host" -P"$db_port" -p"$db_passwd" -e "Create Schema ${db_name} Charset=utf8 Collate utf8_general_ci"
    mysql -u "$db_user" -h "$db_host" -P"$db_port" -p"$db_passwd" "${db_name}" < ${SQL_dir}/Game.sql
    mysql -u "$db_user" -h "$db_host" -P"$db_port" -p"$db_passwd" "${db_name}" < ${SQL_dir}/Guild.sql
    mysql -u "$db_user" -h "$db_host" -P"$db_port" -p"$db_passwd" "${db_name}" < ${SQL_dir}/Mail.sql
}

Import_Database(){
    # $1 type $2 dbuser $3 dbhost $4 dbport $5 dbpasswd $6 dbname
    if [[ "$#" != "6" ]]; then
        echo "Import_Database: Parameter error !"
        exit 1
    fi

    db_user="$1"
    db_host="$2"
    db_port="$3"
    db_passwd="$4"
    db_name="$5"
    db_file="$6"

    echo -e "\nImport ${db_file} to ${db_name} "
    
    mysql -u "$db_user" -h "$db_host" -P"$db_port" -p"$db_passwd" "${db_name}" < "${db_file}"
}

Check_DB(){
    if [[ "$#" != "5" ]]; then
        echo "Create_Database: Parameter error !"
        exit 1
    fi

    db_user="$1"
    db_host="$2"
    db_port="$3"
    db_passwd="$4"
    db_name="$5"

    echo "Check $db_name"
    mysql -u "$db_user" -h "$db_host" -P"$db_port" -p"$db_passwd" -e "desc ${db_name}.Guild;desc ${db_name}.Player;desc ${db_name}.Mails;" > /dev/null 2>&1
    if [[ "$?" == 0 ]]; then
        echo "${db_name}  is no problem."
    else
        echo "${db_name} is bad!"
        exit 1
    fi
}

Check_file(){

    db_file="$1"

    if [[  -s "${db_file}" ]]; then
        echo "$db_file backup successfully !"
    else
        echo "$db_file Backup Filed . exiting ..."
        exit 1
    fi
}



# Backup Retention game service
Dump_Database "$Keep_DB_User" "$Keep_DB_IP" "$Keep_DB_Port" "$Keep_DB_Passwd" "$Keep_DB_Name" "${Keep_DB_Name}_${backup_date}_MBackup.sql"
# Check whether the backup was successful.
Check_file "${Keep_DB_Name}_${backup_date}_MBackup.sql"

# Backups are merged game service.
Dump_Database "$Merged_DB_User" "$Merged_DB_IP" "$Merged_DB_Port" "$Merged_DB_Passwd" "$Merged_DB_Name" "${Merged_DB_Name}_${backup_date}_MBackup.sql"
# Check whether the backup was successful.
Check_file "${Merged_DB_Name}_${backup_date}_MBackup.sql"



# Create a temp database.
Create_Database "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Keep_DB_Name}_${backup_date}_TMP"
# Check it.
Check_DB "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Keep_DB_Name}_${backup_date}_TMP"

Create_Database "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Merged_DB_Name}_${backup_date}_TMP"

Check_DB "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Merged_DB_Name}_${backup_date}_TMP"

# Create Merged database
Create_Database "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Keep_DB_Name}_${backup_date}_Merged"
Check_DB "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Keep_DB_Name}_${backup_date}_Merged"

# Importing temporary database.
Import_Database  "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Keep_DB_Name}_${backup_date}_TMP" "${Keep_DB_Name}_${backup_date}_MBackup.sql"
Import_Database  "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Merged_DB_Name}_${backup_date}_TMP" "${Merged_DB_Name}_${backup_date}_MBackup.sql"

# Begin Merge
cd $DBMergeTool_Dir
echo "Switch to: `pwd`"

test -f main.py || exit 1

mv config.py config.py.${Keep_Serverid}_${backup_date}.bak

echo "# -*- coding: utf-8 -*-

__Common = {
    \"Host\": \"${Temp_DB_IP}\",
    \"User\": \"${Temp_DB_User}\",
    \"Password\": \"${Temp_DB_Passwd}\",
}

SourceDBFrom = {
    \"Database\": \"${Merged_DB_Name}_${backup_date}_TMP\",
    \"ServerID\": ${Merged_Serverid},
    \"Host\": __Common[\"Host\"],
    \"User\": __Common[\"User\"],
    \"Password\": __Common[\"Password\"],
}

SourceDBTo = {
    \"Database\": \"${Keep_DB_Name}_${backup_date}_TMP\",
    \"ServerID\": ${Keep_Serverid},
    \"Host\": __Common[\"Host\"],
    \"User\": __Common[\"User\"],
    \"Password\": __Common[\"Password\"],
}

TargetDB = {
    \"Database\": \"${Keep_DB_Name}_${backup_date}_Merged\",
    \"ServerID\": SourceDBTo[\"ServerID\"],
    \"Host\": __Common[\"Host\"],
    \"User\": __Common[\"User\"],
    \"Password\": __Common[\"Password\"],
}" > config.py

if [[ -f config.py ]]; then
    echo -e "\033[32m `cat config.py` \033[0m"
    read -p " Enter Y to continue， Enter to exit: " right
    if [[ "x$right" == "xY" ]]; then
        python main.py
    else
        exit 1
    fi
fi

echo ""
cd "$DB_Backup_Dir"
echo "Switch to: `pwd`"

# backup database
Dump_Database "$Temp_DB_User" "$Temp_DB_IP" "$Temp_DB_Port" "$Temp_DB_Passwd" "${Keep_DB_Name}_${backup_date}_Merged" "${Keep_DB_Name}_${backup_date}_Merged.sql"
# check mysql dump file
Check_file "${Keep_DB_Name}_${backup_date}_Merged.sql"

# Create a database game server.
Create_Database "$Keep_DB_User" "$Keep_DB_IP" "$Keep_DB_Port" "$Keep_DB_Passwd" "${Keep_DB_Name}_${backup_date}"

# import it
Import_Database "$Keep_DB_User" "$Keep_DB_IP" "$Keep_DB_Port" "$Keep_DB_Passwd" "${Keep_DB_Name}_${backup_date}" "${Keep_DB_Name}_${backup_date}_Merged.sql"

# check check check
Check_DB "$Keep_DB_User" "$Keep_DB_IP" "$Keep_DB_Port" "$Keep_DB_Passwd" "${Keep_DB_Name}_${backup_date}"


echo -e "\nMerge Completed, enjoy it! "
exit 0