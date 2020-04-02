yesterday=$(date --date="yesterday" +"%d%m%Y")

filename="NLVN-limit-22h-${yesterday}"

cat /root/messages > /root/$filename
mv /root/$filename /bkfarm/log/block-22h
rm -f /root/messages

