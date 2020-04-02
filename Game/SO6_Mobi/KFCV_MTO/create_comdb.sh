#!/bin/bash

SQL_dir="./SQL"

# common database
db_user="root"
db_host="127.0.0.1"
db_port="3306"
db_passwd="123456"


mysqlconnect="mysql -u $db_user -h $db_host -P$db_port -p$db_passwd"


Create_database(){
    
    # check mysql connections
    $mysqlconnect -e " show databases;"  > /dev/null 2>&1
    if [[ "$?" != "0" ]]; then
        echo "GameData connected failed "
        exit 1
    fi

    $mysqlconnect -e "Create Schema $1 Charset=utf8 Collate utf8_general_ci"
     
    case $1 in
        comm )
            $mysqlconnect comm < ${SQL_dir}/ActiveKey.sql
            $mysqlconnect comm < ${SQL_dir}/Invitation.sql
            ;;
        gmdb )
            $mysqlconnect gmdb < ${SQL_dir}/GM.sql
            ;;
        pay )
            $mysqlconnect pay < ${SQL_dir}/IAP.sql
            ;;
        web )
            $mysqlconnect web < ${SQL_dir}/WebCenter.sql
            ;;
    esac
}


Create_database comm
Create_database gmdb
Create_database pay
Create_database web