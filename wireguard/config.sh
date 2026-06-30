apt update
apt install wireguard -y
cp /root/proxy-config/wireguard/wg0.conf /etc/wireguard/wg0.conf
systemctl start wg-quick@wg0
systemctl enable wg-quick@wg0
systemctl status wg-quick@wg0 --no-pager