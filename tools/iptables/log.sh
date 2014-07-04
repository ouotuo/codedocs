#modify /etc/syslog.conf
kern.=notice  /var/log/firewall.log
#notice=5

service syslog restart


iptables -A INPUT -p tcp --dport 22 -j LOG --log-level 5 --log-prefix "iptables:"
