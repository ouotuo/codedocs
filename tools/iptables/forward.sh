#可能需要配置
/etc/sysctl.conf
net.ipv4.ip_forward = 1
sysctl -p

#本地重定向
sudo iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to 80

#转发到内网的机器
#7777--->10.2.124.205:5678
iptables -t nat -A PREROUTING -p tcp -d 10.2.110.203 --dport 7777 -j DNAT --to 10.2.124.205:5678 
iptables -t nat -A POSTROUTING -p tcp -d 10.2.124.205 --dport 5678 -j MASQUERADE

#转发到外网的机器
#7777--->180.168.146.170:26213
iptables -t nat -A PREROUTING -p tcp -d 10.2.110.203 --dport 7777 -j DNAT --to 180.168.146.170:26213
iptables -t nat -A POSTROUTING -p tcp -d 180.168.146.170 --dport 26213 -j MASQUERADE
remote port


