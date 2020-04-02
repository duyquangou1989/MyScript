#!/bin/bash
MAX=30
FIL=$(df -H | grep -vE "tmpfs|Filesystem|Use" | awk '{print $5 " " $1}')
USED=$(echo $FIL | cut -d% -f1)
PART=$(echo $FIL | awk '{print $2}')

echo $FIL
echo $USED
echo $PART

[ $USED -gt $MAX ] && echo "Partion $PART use $USED" || echo "Partion $PART dont reach"