#!/bin/sh
iptables -t nat -I POSTROUTING 1 -s 10.9.0.0/24 -o enp1s0 -j MASQUERADE
iptables -I INPUT 1 -i tun+ -s 10.9.0.0/24 -j ACCEPT
iptables -I FORWARD 1 -i tun+ -s 10.9.0.0/24 -j ACCEPT
iptables -I FORWARD 1 -o tun+ -d 10.9.0.0/24 -j ACCEPT
iptables -I INPUT 1 -i enp1s0 -p tcp --dport 1194 -j ACCEPT