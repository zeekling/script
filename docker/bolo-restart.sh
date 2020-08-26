#!/bin/bash

#
# Solo docker 更新重启脚本
#
# 1. 请注意修改参数
# 2. 可将该脚本加入 crontab，每日凌晨运行来实现自动更新
#
docker stop bolo
docker rm bolo
docker run --detach --name bolo --network=host  \
    --env RUNTIME_DB="MYSQL" \
	--env JAVA_OPTS="-Xms265m -Xmx265m -Xmn170m -Xloggc:/var/log/gc.log" \
    --env JDBC_USERNAME="root" \
    --env JDBC_PASSWORD="123456" \
    --env JDBC_DRIVER="com.mysql.cj.jdbc.Driver" \
	--env SERVER_HOST="www.zeekling.cn" \
	--env SERVER_PORT="443" \
	--env SERVER_SCHEME="https" \
    --env JDBC_URL="jdbc:mysql://127.0.0.1:3306/solo?useUnicode=yes&characterEncoding=UTF-8&allowPublicKeyRetrieval=true&useSSL=false&serverTimezone=UTC" \
    -v /dockerData/bolo/bolo-fantastic:/opt/bolo/skins/bolo-fantastic \
    -v /dockerData/bolo/bolo-NeoEase:/opt/bolo/skins//bolo-NeoEase-mod \
    zeek/bolo \
	--lute_http=http://127.0.0.1:8249
# zeek/bolo --listen_port=8080 --server_scheme=https --server_host=www.zeekling.cn \

    #b3log/solo --listen_port=8080 --server_scheme=https --server_host=www.zeekling.cn \
##--env JDBC_URL="jdbc:mysql://172.27.0.17:3306/solo?useUnicode=yes&characterEncoding=UTF-8&useSSL=false&serverTimezone=UTC" \
#docker start solo
