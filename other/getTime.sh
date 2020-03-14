#!/usr/bin/env bash

# 用于获取时间差

function getTime()
{
	START_S=$(echo $1 | cut -d '.' -f 1)
	START_NS=$(echo $1 | cut -d '.' -f 2)
	END_S=$(echo $2 | cut -d '.' -f 1)
	END_NS=$(echo $2 | cut -d '.' -f 2)
	TIME=$[(10#$END_S - 10#$START_S) * 1000 + (10#$END_NS - 10#$START_NS) / 1000000]
	echo $TIME
}

START=$(date +%s.%N)
ls >& /dev/null
END=$(date +%s.%N)
DIFF=$(getTime $START $END)
echo $DIFF"ms"
