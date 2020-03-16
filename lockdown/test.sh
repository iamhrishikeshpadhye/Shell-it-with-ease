#!/bin/bash

TIMESTAMP=$(date +%R.%S-%B-%d)

FILE=/root/Hrishikesh/lockdown/count

cd /root/Hrishikesh/lockdown/
if [ -f "$FILE" ]; then
    :
else
    echo "1">count
fi

counter=$(cat count)
counter=$(($counter + 1))
echo "$counter">count
if [[ $counter == 3 ]]
then
	echo "0">count
	ffplay -nodisp -autoexit -loop 10 alert.mp3 >/dev/null 2>&1 &
fi

