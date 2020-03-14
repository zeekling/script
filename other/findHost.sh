#!/usr/bin/env bash 
#
# 此脚本用于查找可用ip

find_ip="www.baidu.com"
ok="false"
ok_ip="127.0.0.1"
count=1
read -p "please input ip:" find_ip 
while [[ "${ok}" == "false" ]]
do 
    echo "开始第${count}次查找"
    result=`nslookup ${find_ip}  74.82.42.42`
    tmp=`echo ${result} | sed "s/: /:/g" | 
    awk '{split($0,arr," "); for (i = 0;i < length(arr);i++){ if(match(arr[i],"Address:") ){ if (i>4){print arr[i] } } } }' |
    awk '{split($0,arr,":"); print arr[2] }'`
    for arr in $tmp
    do 
        ping=`ping -c 1 ${arr} | awk 'NR==5 {print $4}'`
        echo begin${ping}end
        if [ "${ping}" != "" ]
        then 
            ok="true";
            ok_ip=${arr};
            break;
        else 
            echo "${arr} is not available!"
        fi 
    done
    echo "第${count}次查找结束"
    count=$[${count}+1]
done 
echo ${find_ip},${ok_ip}
