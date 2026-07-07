# wget https://raw.githubusercontent.com/angristan/openvpn-install/master/openvpn-install.sh
# chmod +x openvpn-install.sh
# ./openvpn-install.sh install
echo "" > /etc/openvpn/server/server-tcp.conf
cp /root/proxy-config/openvpn/server/server-tcp.conf /etc/openvpn/server/server-tcp.conf
systemctl restart openvpn-server@server-tcp
systemctl enable openvpn-server@server-tcp
systemctl status openvpn-server@server-tcp --no-pager
./rm-openvpn-rules.sh
./add-openvpn-rules.sh