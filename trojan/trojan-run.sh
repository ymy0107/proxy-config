#!/bin/sh
pkill -f "trojan"
stdbuf -oL -eL ./trojan -c ./config.json >> ./trojan.log 2>&1 & true