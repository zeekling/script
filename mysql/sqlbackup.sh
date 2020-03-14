#!/usr/bin/env bash
#####################################################################
# 用来备份当前项目的数据库，以免错误操作导致数据丢失				#
# author 令照辉														#
# 写这个脚本的原因：												#
#	懒得用图形化界面备份，还有就是图形化界面备份的小哥我不满意		#
# 脚本写的简单仅供自己使用											#
#####################################################################

# 默认数据
IP="127.0.0.1"
DATABASE="mysql"
BACKUPDIR=`pwd`

# read ip
read -p "请输入mysql所在服务器的ip地址(默认为127.0.0.1):" inip
if test -z ${inip};then
	echo "您输入的ip是 ${IP}"
else
	IP=${inip}
	echo "您输入的ip是 ${IP}"
fi

# read database
read -p "请输入需要备份的数据库名称:" indatabse
if test -z ${indatabse};then
	echo -e "\033[32m您没有输入数据库名称! \033[37m"
	exit 1
else
	DATABASE=${indatabse}
	echo "您输入的数据库名称是 ${DATABASE}"
fi

# read back fold
read -p "请输入备份文件夹位置(当前文件夹):" inbackup
if test -z ${inbackup};then
	echo "备份文件夹位置 ${BACKUPDIR}"
else
	BACKUPDIR=${inbackup}
	echo "您的备份文件夹位置 ${BACKUPDIR}"
fi

if [ !  -d ${BACKUPDIR} ];then
	echo "目录${BACKUPDIR} 不存在，新建${BACKUPDIR}"
	mkdir ${BACKUPDIR} -p
fi

# backup
cd ${BACKUPDIR} && echo "进入${BACKUPDIR}目录成功" || echo "进入${BACKUPDIR}目录失败"
NOW=`date +"%Y-%m-%d--%H:%M:%S"`
FILE=${NOW}.sql
mysqldump -u root -h ${IP} -p  ${DATABASE} > ${FILE} &&
	echo "备份成功" || echo "备份失败，请重试"
