# 2. 配置防火墙 (假设你的外网网卡是 enp1s0，如果不是请用 ip route show 改写)
iptables -t nat -A POSTROUTING -s 10.10.10.0/24 -o enp1s0 -j MASQUERADE
iptables -A FORWARD -s 10.10.10.0/24 -j ACCEPT
iptables -A FORWARD -d 10.10.10.0/24 -m state --state ESTABLISHED,RELATED -j ACCEPT

# 开放 IKEv2 端口 (UDP 500 和 4500)
sudo iptables -A INPUT -p udp --dport 500 -j ACCEPT
sudo iptables -A INPUT -p udp --dport 4500 -j ACCEPT

# 3. 持久化 iptables（防止重启失效）
# apt install iptables-persistent -y