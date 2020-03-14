#!/usr/bin/env bash
#
# 用来获取图片，并且自动命名的脚本，解放劳动力
#
DIR_HOME=`pwd`
echo $DIR_HOME
endStr=".png"
FILES=`ls $DIR_HOME`
max=0
for fileName in $FILES
do
	len=`expr ${#fileName} - ${#endStr}`
	tmpStr=${fileName:0:len}
	expr $tmpStr "+" 1 &> /dev/null
	if [ $? -eq 0  ];then
		if [ $tmpStr -gt $max ];then
			max=$tmpStr
		fi
	fi
done
max=`expr $max + 1`
filePath=`echo $max$endStr`
if test -z $1;then
	exit
fi
if [ ! -d $filePath ];then
   wget $1 -O "$filePath"
else
	echo $filePath "is not exist"
fi
