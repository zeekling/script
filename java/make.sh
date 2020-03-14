#!/usr/bin/env bash
#author:lzh
# 用来编译普通的java 项目，不适合于web等项目
function getTime()
{
	START_S=$(echo $1 | cut -d '.' -f 1)
	START_NS=$(echo $1 | cut -d '.' -f 2)
	END_S=$(echo $2 | cut -d '.' -f 1)
	END_NS=$(echo $2 | cut -d '.' -f 2)
	TIME=$[(10#$END_S - 10#$START_S) * 1000 + (10#$END_NS - 10#$START_NS) / 1000000]
	echo $TIME
}

SOURCE="1.8"
TARGET="1.8"
OUT="target"
echo  -e "开始查找jar包"
LIB=`find -name "*.jar"`
echo "查找jar包结束"
if [ ! -d $OUT ];then
	mkdir $OUT
else
	rm -rf $OUT/*
fi
echo "开始查找java文件"
FILES=`find -name "*.java"`
ALL=`find -name "*"`
echo "查找java文件结束"
echo "开始编译java文件"
START=$(date +%s.%N)
javac -g -source $SOURCE -target $TARGET -d ./$OUT/ $FILES -encoding UTF-8 &&
echo -e "\033[32m编译成功 *_* \033[37m" ||
echo -e "\033[31m编译出错了 \033[0m \033[37m"
END=$(date +%s.%N)
DIFF=$(getTime $START $END)
echo -e "\033[33m编译耗时:"$DIFF"ms \033[37m"

