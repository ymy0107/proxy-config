cd
clear
apt install shadowsocks-libev -y
cp /root/proxy-config/shadowsocks/config.json /etc/shadowsocks-libev/config.json
systemctl restart shadowsocks-libev
systemctl enable shadowsocks-libev
systemctl --no-pager status shadowsocks-libev