#!/bin/sh
iptables -t nat -D POSTROUTING -s 10.9.0.0/24 -o enp1s0 -j MASQUERADE
iptables -D INPUT -i tun+ -s 10.9.0.0/24 -j ACCEPT
iptables -D FORWARD -i tun+ -s 10.9.0.0/24 -j ACCEPT
iptables -D FORWARD -o tun+ -d 10.9.0.0/24 -j ACCEPT
iptables -D INPUT -i enp1s0 -p tcp --dport 1194 -j ACCEPT