pkill -f "trojan"
stdbuf -oL -eL ./trojan -config ./config.json >> ./logs/trojan.log 2>&1 & true