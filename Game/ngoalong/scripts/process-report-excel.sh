yesterday=$(date --date="yesterday" +"%Y-%m-%d")
#yesterday="2012-09-15"
srcdir=/home/ngoalong/www/data/temp/marketting/$yesterday
desdir=/home/ngoalong/www/data/temp/marketting/report/$yesterday
mkdir $desdir

arr_bannerid=( -1  1000  1001 1002 1003 -2 66 95 74 211 191 192 103  475 447 452 472 64 198 213 208 75 205 83 26 222 69 94 89 68 470 43 101 483 204 107 67 387 113 105 28 115 88 86 11 15 492 408 17 439 21 434 402 407 406 405 482 561 525 524 523 516 515 514 519 518 528 527 517 503 526 513 509 512 511 510 508 507 506 505 504 500 207 462 474 5 106 476 )
for bannerid in ${arr_bannerid[@]}
do
	cd $desdir
	temp=$bannerid
	if [ $bannerid -lt 0 ];then
		  temp=${bannerid:1:1}
		  mkdir $desdir/$temp
	else
		 mkdir $desdir/$temp
	fi
	cd $srcdir
	for file in `ls`;do
	if [ $file != 'parse-result.txt' ];then
	   awk -F '|' '{printf "%s;%s;%s;|%s|;%s;%s\n",$1,$2,$3,$4,$5,$6}' $file > temp.txt
	   cat temp.txt |grep \|$bannerid\| |awk -F ';' '{ if($2==1){$2="Loading page"} else if($2==2){$2="Before enter rolename"} else if($2==3){$2="Before entering game"} else if($2==4){$2="Entered game"} else {if($2>=100){$2=$2-100}}printf "%s|%s|%s|%s\n",$1,$2,$3,$6}' >> $desdir/$temp/$temp".csv"
	fi
	done
	rm -f temp.txt
done
