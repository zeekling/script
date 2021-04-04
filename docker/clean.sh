#sync
#apt clean
echo 3 > /proc/sys/vm/drop_caches
echo "" > /var/log/btmp
cd /var/log/nginx && rm -rf *.gz && rm -rf *.1
cd /var/log/ && rm -rf *.gz && rm -rf *.1
cd /var/log && rm -rf auth.log-*

rm -rf /root/updateGithub/logs/log.log.*
rm -rf /root/updateGithub/logs/error.log.*

mysql -uroot -p -h127.0.0.1 -p94adg2011 -e "reset master"

bash /root/script/clean_docker.sh
