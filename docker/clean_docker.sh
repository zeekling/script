#!/usr/bin/env bash

echo "======== docker containers logs file size ========"

logs=$(find /var/lib/docker/containers/ -name *-json.log)

for log in $logs
do
	filesize=`ls -l $log | awk '{ print $5  }'`
	echo "deling $log size: $filesize"
	allsize=`awk '{print NR}' $log | tail -n1`
	while [[ "$allsize" -gt "100" ]]
	do
	    sed -i '1,100d' $log > /dev/null
	    allsize=`awk '{print NR}' $log | tail -n1`
	done
	echo "after del size:$allsize"
done
