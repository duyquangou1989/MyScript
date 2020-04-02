# config new server
 
CommonServe Include:

- GMServerd
- PayServerd

GameServer Include:

- AuthServerd
- BattleManagerd
- BattleServerd
- GameServerd

You can only deploy a CommonServer, using multiple GameServer.

so, open new server, You only need to modify `gs.config`.

Several Notable configuration:
`gsconfig`

    [Main]
	# A game server corresponds to a game ID
    ServerID=SERVERID
	# Ditto
    ServerName=shaolinSERVERID
	# If you run multiple GameServer on the same server, you need to change the port.
    ServicePort=8899
    MaxClients=3000
	[AuthClient]
	[PayClient]
	[GMClient]
	[BattleManager]
	……
    [GameDatabase]
	# Connect to the database server you plan.
    [Log_Normal]
    # Connect to the database server you plan.
    [ActiveKey]

# Megre Server

I recommend that you read the script: `MergeServer.sh`

Merge B to A

runtime is `20151228`

when GameServerd closed.

backup A and B, like this command:

    tar zcf GameServerA_backup_20151228.tar.gz /home/cmge/shaolin


Modify `MergeServer.sh`, Refer to the following configuration:

    # Reserved game server ServerID
    Keep_Serverid="40001" # A's ServerID
    
    # Reserved service database information, database combined service is generally created after this server.
    
    Keep_DB_IP="127.0.0.1"
    Keep_DB_Port="3306"
    Keep_DB_User="root"
    Keep_DB_Passwd="123456"
    Keep_DB_Name="Game_data_A"
    
    # Be merged server ServerID
    Merged_Serverid="40002" B's ServerID
    
    # Be merged database information service
    
    Merged_DB_IP="127.0.0.1"
    Merged_DB_Port="3306"
    Merged_DB_User="root"
    Merged_DB_Passwd="123456"
    Merged_DB_Name="Game_data_B"
    
    # The temporary use of the database.
    Temp_DB_IP="127.0.0.1"
    Temp_DB_Port="3306"
    Temp_DB_User="root"
    Temp_DB_Passwd="123456"
    
    
    DB_Backup_Dir="/data/DBBackup"
    DBMergeTool_Dir="/data/DBMergeTool"
    backup_date=`date "+%Y%m%d"`
    SQL_dir="/home/cmge/shaolin/SQL"
    


run `DBMergeTool/MergeServer.sh`

It will generate a new database after successful implementation: `Game_data_A_20151228`

Modify A's `gs.config.[GameDatabase].Game_data_A` to `Game_data_A_20151228`
