sync
apt clean
echo 3 > /proc/sys/vm/drop_caches
echo "" > /var/log/btmp
cd /var/log/nginx && rm -rf *.gz && rm -rf *.1
cd /var/log/ && rm -rf *.gz && rm -rf *.1
cd /var/log && rm -rf auth.log-*

