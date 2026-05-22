pkill -f "trojan"
stdbuf -oL -eL ./trojan -config ./config.json >> ./trojan.log 2>&1 & true