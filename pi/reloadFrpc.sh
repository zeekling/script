#!/usr/bin/env bash

frp=`ps -ef | grep "./frpc -c ./frpc.ini" | wc -l`
if [ "${frp}" -eq "1" ];then
	cd /home/pi/frp_0.26.0_linux_arm && ./frpc -c ./frpc.ini > /tmp/frpc.log 2>&1 &
	echo "\n\n" >> /tmp/frpc.log
	exit 0
fi

deadline=`tail -n 2 /tmp/frpc.log  | grep "deadline reached" | wc -l`
pids=`pgrep -f "./frpc -c ./frpc.ini"`
if [ "${deadline}" -eq "1" ];then
	for pid in ${pids}
	do
		kill ${pid}
	done
	cd /home/pi/frp_0.26.0_linux_arm && ./frpc -c ./frpc.ini > /tmp/frpc.log 2>&1 &
	echo "\n\n" >> /tmp/frpc.log
	exit 0
fi
