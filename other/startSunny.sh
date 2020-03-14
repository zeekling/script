#!/bin/bash
# 用来检查内网穿透是否断开,断开则会重新连接，可与cron结合使用，定期检查内网穿透软件是否断开

#./sunny clientid d6e99e5b056d9016
count=`ps aux | grep natapp | wc -l`
if [ "${count}" == "1" ];  then
  ./natapp -authtoken=4c329f21d364bf71  &
else
        echo "已经启动内网穿透软件"
fi
