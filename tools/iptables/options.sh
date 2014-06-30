#protocol tcp,udp,icmp
iptables -A INPUT -p tcp --dport 22 -j ACCEPT

#-i -o
iptables -A INPUT -i lo -j ACCEPT

#ip and port --sport
iptables -A INPUT -s 192.168.0.4 -j ACCEPT
iptables -A INPUT -s 192.168.0.0/24 -j ACCEPT
iptables -A INPUT -s 192.168.0.0/255.255.255.0 -j ACCEPT
iptables -A INPUT -s 192.168.0.4 -m mac --mac-source 00:50:8D:FD:E6:32 -j ACCEPT
iptables -A INPUT -p tcp --dport 6881 -j ACCEPT
iptables -A INPUT -p tcp --dport 6881:6890 -j ACCEPT
iptables -A INPUT -p tcp --destination-port 80 -m iprange --src-range 192.168.1.100-192.168.1.200 -j ACCEPT


#j  ACCEPT DROP

#limit
iptables -A INPUT -p tcp --syn --dport 22 -m connlimit --connlimit-above 3 -j REJECT
iptables -p tcp --syn --dport 80 -m connlimit --connlimit-above 20 --connlimit-mask 24 -j DROP

#state NEW,ESTABLISHED,RELATED
iptables -A INPUT -m state --state NEW -p tcp --dport 25 -j ACCEPT

#log
iptables -A INPUT -s 1.2.3.4 -p tcp --destination-port 80 -j LOG --log-level crit
#Log and Drop Packets
iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j LOG --log-prefix "IP_SPOOF A: "
iptables -A INPUT -i eth1 -s 10.0.0.0/8 -j DROP
tail -f /var/log/messages

#nat
iptables -t nat -A POSTROUTING -j SNAT --to-source 192.168.1.20-192.168.1.25


iptables -L
iptables -F
/sbin/service iptables save

