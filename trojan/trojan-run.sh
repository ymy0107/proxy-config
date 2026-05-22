pkill -f "trojan"
sleep 1
stdbuf -oL -eL ./trojan -config ./config.json >> ./trojan.log 2>&1 & true