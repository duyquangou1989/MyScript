yesterday=$(date --date="yesterday" +"%Y-%m-%d")
#yesterday="2012-09-15"
dir=/home/ngoalong/www/data/temp/marketting/$yesterday
cd $dir
	
for file in `ls`;do
awk -F '|' '{ arr[$4":"$2]++;if($6!=""){ arr1[$4"_:"$2]++; }}END { for( i in arr ){printf "%s:%d\n",i,arr[i]}; print "Rolename Area";  for( i in arr1 ){printf "%s:%d\n",i,arr1[i]};}' $file >> $dir/parse-result.txt
done
