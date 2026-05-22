#!/bin/sh
pkill -f "trojan"
stdbuf -oL -eL /root/proxy-config/trojan/trojan -c /root/proxy-config/trojan/config.json >> /root/proxy-config/trojan/trojan.log 2>&1 & true