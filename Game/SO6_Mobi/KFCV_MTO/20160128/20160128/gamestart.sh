#!/bin/bash

# game root dir
homedir="/home/cmge/shaolin1"
#homedir=`pwd`
cd $homedir

backup_date=`date "+%Y%m%d%H%M%S"`
comm="gm ps as"
games="bm bs gs"
start(){
    gamesvr="$1"
    logfile="$2"
    mv nohup.out_*.tar.gz /data/nohupbakup
    echo -e "\nstart $1.. "
    if [[ ! -f "$gamesvr" ]]; then
        echo " $gamesvr Not Found! "
        exit  1
    fi
    if [[ "$gamesvr -x " ]]; then
        chmod +x "$gamesvr"
    fi
    gamepid=`ps -ef | grep $homedir/$gamesvr | grep -v grep | awk '{print $2}'`
    if [[ "${gamepid}x" == "x" ]]; then
        echo   "starting $gamesvr... "
        nohup $homedir/$gamesvr > $logfile 2>&1 &
	sleep 5
        status $gamesvr
    else
        echo  "$gamesvr running... "
    fi
}

stop(){
    echo -e "\nstop $1 ... "
    gamename="$1"
    gamepid=`ps -ef | grep $homedir/$gamename | grep -v grep | awk '{print $2}'`
    if [[ "${gamepid}x" == "x" ]]; then
        echo " $gamename not run... "
        exit 1
    else
        if [[ "${gamename}" == "GameServerd" ]]; then
            kill -31 $gamepid
            echo " $gamename stoping... "
        else
            kill -9 $gamepid
            echo " $gamename stoped. "
        fi
    fi
}

status(){
    echo ""
    gamename="$1"
    gamepid=`ps -ef | grep $homedir/$gamename | grep -v grep | awk '{print $2}'`
    if [[ "${gamepid}x" == "x" ]]; then
        #statements
        echo "$gamename not run... "
    else
        echo "$gamename is running..."
        ps -efw | grep "${gamepid}" | grep -v grep
        netstat -natlp | grep "${gamepid}" | grep -v grep
        echo "$gamename process running time info: $(ps -eo pid,lstart,etime | grep ${gamepid} | cut -d" " -f2-)"
    fi
}
error(){
            echo "Usage: $0 {gm|ps|as|bm|bs|gs|common|game}{start|stop|status}"
            echo "
              gm: GMServerd
              ps: PayServerd
              as: AuthServerd
              bm: BattleManagerd
              bs: BattleServerd
              gs: GameServerd
              common: GMServerd  PayServerd AuthServerd
              game: BattleManagerd BattleServerd GameServerd 
            "
            exit 1
}

run(){
    case $1 in
        gm)
                tar zcf "nohup.out_gm_${backup_date}.tar.gz" nohup.out_gm
                start GMServerd "nohup.out_gm"
            ;;
        ps )
                tar zcf "nohup.out_ps_${backup_date}.tar.gz" nohup.out_ps
                start PayServerd "nohup.out_ps"
            ;;
        as )
                tar zcf "nohup.out_as_${backup_date}.tar.gz" nohup.out_as
                start AuthServerd "nohup.out_as"
            ;;
        bm )
                tar zcf "nohup.out_bm_${backup_date}.tar.gz" nohup.out_bm
                start BattleManagerd "nohup.out_bm"
            ;;
        bs )
                tar zcf "nohup.out_bs_${backup_date}.tar.gz" nohup.out_bs
                start BattleServerd "nohup.out_bs"
            ;;
        gs )
                tar zcf "nohup.out_gs_${backup_date}.tar.gz" nohup.out_gs
                start GameServerd "nohup.out_gs"
            ;;
        common )
                for i in ${comm[*]}; do
                    run $i
                done
            ;;
        game )
                for i in ${games[*]}; do
                    run $i
                done
            ;;
        * )
                error
            ;;
    esac
}

stop_status(){

    case $1 in
        gm)
                $action GMServerd
            ;;
        ps )
                $action PayServerd
            ;;
        as )
                $action AuthServerd
            ;;
        bm )
                $action BattleManagerd
            ;;
        bs )
                $action BattleServer
            ;;
        gs )
                $action GameServerd
            ;;
        common )
                for i in ${comm[*]}; do
                    stop_status $i
                done
            ;;
        game )
                for i in ${games[*]}; do
                    stop_status $i
                done
            ;;
        * )
                error
            ;;
    esac
}
cd $homedir
action="$2"
mkdir -p /data/nohupbakup > /dev/null 2>&1


if [[ "$action" == "start" ]]; then
    run $1 $action
elif [[ "$action" == "stop" ]]; then
    #statements
    stop_status $1 $action
elif [[ "$action" == "status" ]]; then
    #statements
    stop_status $1 $action
else
    error
fi
