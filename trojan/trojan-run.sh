#!/bin/sh
# pkill -f "trojan"
# stdbuf -oL -eL /root/proxy-config/trojan/trojan -c /root/proxy-config/trojan/config.json >> /root/proxy-config/trojan/trojan.log 2>&1 & true
cp /root/proxy-config/trojan/trojan /usr/bin/trojan
cp /root/proxy-config/trojan/config.json /etc/trojan/config.json
cp /root/proxy-config/trojan/trojan.service /etc/systemd/system/trojan.service

systemctl daemon-reload
systemctl enable trojan.service
systemctl restart trojan.service
systemctl status trojan.service --no-pager