#!/usr/bin/env bash
#author: lzh
echo "compiling......................"
mvn compile 
if [ ! $0  ];then
	echo "compile failed"
	exit 1
fi
echo "compile finish.........."
mvn package -DskipTests
if [ ! $0 ];then
	echo "package failed"
	exit 1
fi
echo "package finish"
if test -z $1;then
	echo "please input your project name"
	exit 1
fi
if test -z $2;then
	echo "please input your tomcat home"
	exit 1
else
	echo $1
	echo $2
	cp `pwd`/target/$1 $2/webapps/
	exit 0
fi

