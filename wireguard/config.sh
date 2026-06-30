apt install wireguard iptables -y
echo "" > /etc/wireguard/wg0.conf
cp /root/proxy-config/wireguard/wg0.conf /etc/wireguard/wg0.conf
systemctl restart wg-quick@wg0
systemctl enable wg-quick@wg0
systemctl status wg-quick@wg0 --no-pager