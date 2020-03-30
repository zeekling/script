#!/bin/bash

#
# Solo docker 更新重启脚本
#
# 1. 请注意修改参数
# 2. 可将该脚本加入 crontab，每日凌晨运行来实现自动更新
#
docker pull b3log/solo
docker stop solo
docker rm solo
docker run --detach --name solo --network=host -m 500m \
    --env RUNTIME_DB="MYSQL" \
    --env JDBC_USERNAME="root" \
    --env JDBC_PASSWORD="94adg2011" \
    --env JDBC_DRIVER="com.mysql.cj.jdbc.Driver" \
    --env JDBC_URL="jdbc:mysql://127.0.0.1:3306/solo?useUnicode=yes&characterEncoding=UTF-8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC" \
    --volume /dockerData/solo/skins/Casper:/opt/solo/skins/Casper-Mod \
    --volume /dockerData/solo/skins/Pinghsu:/opt/solo/skins/Pinghsu-Mod \
    --volume /dockerData/solo/skins/solo-sakura:/opt/solo/skins/solo-sakura \
    b3log/solo --listen_port=8080 --server_scheme=https --server_host=www.zeekling.cn \
	--lute_http=http://127.0.0.1:8249

    #b3log/solo --listen_port=8080 --server_scheme=https --server_host=www.zeekling.cn \
##--env JDBC_URL="jdbc:mysql://172.27.0.17:3306/solo?useUnicode=yes&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC" \
#docker start solo
