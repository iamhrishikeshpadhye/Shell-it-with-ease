#!/bin/bash

i=2
f=0

if test $1 -lt 1
then
	echo "ERROR:INVALID INPUT"
	exit
elif test $1 -eq 1
then
	echo "1 is neither a prime nor a composite number"
	exit
fi

while test $i -le `expr $1 / 2`
do
	if test `expr $1 % $i` -eq 0
	then
		f=1
	fi
	
	i=`expr $i + 1`
done

if test $f -eq 1
then
	echo "Not a prime number"
else
	echo "It is a prime number"
fi
