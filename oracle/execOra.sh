#!/usr/bin/env bash

# 执行ORACLE sql文件
# sqlplus eode/foo
# export NLS_LANG="AMERICAN_AMERICA.AL32UTF8"
# 当执行脚本中有select时会在控制台打印两次结果,当在select语句前加了prompt 时会在控制台打印两次查询结果
# 执行过程中遇到的问题:
# 1. 执行sql脚本的时候 prompt如果是以中文结尾的时候，脚本报错，造成原因是编码问题，未解决
# 2. 在执行sql脚本中有需要输入参数时，用这个脚本执行sql时，会默认传入0，达不到效果 found:2017-12-03
# 修改日期    修改人      修改原因
# 20180109    zeekling    添加远程时需要打印的数据
# 20171008    zeekling


USER_NAME="eoda"
PASSWD="foo@pdb"
if test -z $1; then
   echo "请输入SQL文件的位置!"
   exit 1
fi

if [ "$2" != "" ]; then
   USER_NAME=$2
fi

if [ "$3" != "" ]; then
    PASSWD=$3
fi

SQL_PATH=$1
sqlplus -S "${USER_NAME}/${PASSWD}" << EOF
    set long 5000
    set linesize 190
    set autotrace on
    set timing on
    set pagesize 9999
    set serveroutput on
    column plan_plus_exp format a80
    set feedback off
    set echo off
    @${SQL_PATH}
    exit;
EOF
