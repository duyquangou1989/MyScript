#!/bin/bash
#QuangTD2 --- 20151231
#startgamesvr.sh {1|2|...|all} {start|stop|status}
#$1 : SVID -- $2 : Action

homedir="/home/cmge"
backup_date=`date "+%Y%m%d%H%M%S"`

#start with 
#$1 : game service excute file
#$2 : log file backup
#$3 : svid
#start GameServerd out.gs.log 1 
start()
{
	gamesvr="$1"
	logfile="$2"
	svid="$3"
	echo -e "\nstart $homedir/shaolin${svid}/$gamesvr.. "
    if [[ ! -f "$homedir/shaolin${svid}/$gamesvr" ]]; then
        echo " $homedir/shaolin${svid}/$gamesvr Not Found! "
        exit  1
	fi
	
	if [[ "$homedir/shaolin${svid}/$gamesvr -x" ]]; then
		chmod +x "$homedir/shaolin${svid}/$gamesvr"
	fi
	
	gamepid=`ps -ef | grep $homedir/shaolin${svid} | grep $gamesvr | grep -v grep | awk '{print $2}'`
	
	#echo "GAME Excute $gamesvr PID = $gamepid"
	#exit
	
	if [[ "${gamepid}x" == "x" ]]; then
		echo "Starting $homedir/shaolin${svid}/$gamesvr"
		nohup $homedir/shaolin${svid}/$gamesvr > $logfile 2>&1 &
	#sleep 5
		status $gamesvr $svid
	else
		echo "$homedir/shaolin${svid}/$gamesvr running ... "
	fi
}

#$1 : Game service excute file
#$2 : svid
#status GameServerd 1 
status()
{
	echo ""
	gamename="$1"
	gamepid=`ps -ef | grep $homedir/shaolin${2} | grep $gamename | grep -v grep | awk '{print $2}'`
	if [[  "${gamepid}x" == "x" ]]; then
		echo "$homedir/shaolin${2}/$gamename not run... "
	else
		echo "$homedir/shaolin${2}/$gamename is running..."
		ps -efw | grep "${gamepid}" | grep -v grep
		echo "$homedir/shaolin${2}/$gamename process running time info : $(ps -eo pid,lstart,etime | grep ${gamepid} | cut -d" " -f2-)"
	fi
}

#$1: Game Excute file
#$2: svid
#stop GameServerd 1
stop()
{
	echo -e "\nstop $1 ... "
    gamename="$1"
    gamepid=`ps -ef | grep /home/cmge/shaolin${2} | grep $gamename | grep -v grep | awk '{print $2}'`
    if [[ "${gamepid}x" == "x" ]]; then
        echo " $gamename not run... "
        exit 1
    else
        if [[ "${gamename}" == "GameServerd" ]]; then
            kill -31 $gamepid
            echo " /home/cmge/shaolin${2}/$gamename stoping... "
        else
            kill -9 $gamepid
            echo " /home/cmge/shaolin${2}/$gamename stoped. "
        fi
    fi
}

#$1 : game excute symbol

#run game 1
run()
{
	svid="$2"
	#cd $homedir/shaolin${svid}
	case $1 in 
		as )
			cd $homedir/shaolin${svid}
			tar zcf "nohup.out_as_${backup_date}.tar.gz" nohup.out_as
            start AuthServerd "nohup.out_as" $svid
			;;
		bm )
			cd $homedir/shaolin${svid}
            tar zcf "nohup.out_bm_${backup_date}.tar.gz" nohup.out_bm
            start BattleManagerd "nohup.out_bm" $svid
            ;;
        bs )
			cd $homedir/shaolin${svid}
            tar zcf "nohup.out_bs_${backup_date}.tar.gz" nohup.out_bs
            start BattleServerd "nohup.out_bs" $svid
            ;;
        gs )
			cd $homedir/shaolin${svid}
            tar zcf "nohup.out_gs_${backup_date}.tar.gz" nohup.out_gs
            start GameServerd "nohup.out_gs" $svid
            ;;
		game )
			cd $homedir/shaolin${svid}
			a="as bm bs gs"
			for i in ${a[*]}; do
				run $i $svid
			done
			;;
		* )
			echo "Wrong!!!"
			exit 1
			;;
	esac
}		

#
stop_status()
{
	svid="$2"
	case $1 in
        as )
                $action AuthServerd $svid
            ;;
        bm )
                $action BattleManagerd $svid
            ;;
        bs )
                $action BattleServer $svid
            ;;
        gs )
                $action GameServerd $svid
            ;;
        game )
                a="as bm bs gs"
                for i in ${a[*]}; do
                    stop_status $i $svid
                done
            ;;
        * )
			echo "Wrong stop_status !!!"
            exit 1
            ;;
    esac
}

#$1 : serverid
#$2 : action
process_start()
{
	svid="$1"
	if [ $svid == "all" ] && [ $2 == "start" ]; then
		for foldergame in `ls $homedir | grep shaolin`;
		do
			id=`echo $foldergame | grep -o "[0-9]"`
			echo "ID = $id"
			run game $id	
		done
	else
		run game $svid
	fi
}

process_stop()
{
	svid="$1"
	action="$2"
	if [ $svid == "all" ] && [ "$action" == "stop" ]; then
		for foldergame in `ls $homedir | grep shaolin`;
		do
			id=`echo $foldergame | grep -o "[0-9]"`
			echo "ID = $id"
			stop_status game $id	
		done
	#else
	#	stop_status game $svid
	fi
}

svid_main="$1"
action="$2"

if [[ "$action" == "start" ]]; then
	process_start $svid_main
elif [ "$action" == "stop" ] && [ "$svid_main" == "all" ]; then
	echo "PROCESS_STOP"
	process_stop $svid_main stopt
else
	echo "STOP_STATUS"
	stop_status game $svid_main
fi
