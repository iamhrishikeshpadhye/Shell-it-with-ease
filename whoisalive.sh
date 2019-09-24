#!/bin/bash

is_alive_ping()
{
	ping -c 1 $1 > /dev/null
	[ $? -eq 0 ] && echo Node with IP: $i is up.
}

for j in {10..15}		#Replace the range with your desired range
do
	for i in 10.10.$j.{1..255}		#Replace the ip address class with your network's class
	do
		is_alive_ping $i & disown
	done
done
