#重定向
sudo iptables -t nat -A PREROUTING -p tcp --dport 8080 -j REDIRECT --to 80

#nat
# 用DNAT作端口映射
iptables -t nat -A PREROUTING -d a.b.c.d -p tcp --dport 80 -j DNAT --to 192.168.1.10
# 用SNAT作源地址转换（关键），以使回应包能正确返回
iptables -t nat -A POSTROUTING -d 192.168.1.10 -p tcp --dport 80 -j SNAT --to 192.168.1.1
# 一些人经常忘了打开FORWARD链的相关端口，特此增加
iptables -A FORWARD -o eth0 -d 192.168.1.10 -p tcp --dport 80 -j ACCEPT
iptables -A FORWARD -i eth0 -s 192.168.1.10 -p tcp --sport 80 -m --state ESTABLISHED -j ACCEPT
