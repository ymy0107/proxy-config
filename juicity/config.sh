# wget https://github.com/juicity/juicity/releases/download/v0.5.0/juicity-linux-x86_64.zip
# unzip juicity-linux-x86_64.zip -d juicity


mkdir -p /etc/juicity
cp /root/proxy-config/juicity/server.json /etc/juicity/server.json
cp /root/proxy-config/juicity/juicity-server /usr/bin/juicity-server
cp /root/proxy-config/juicity/juicity-server.service /etc/systemd/system/juicity-server.service

systemctl daemon-reload
systemctl enable juicity-server.service
systemctl restart juicity-server.service
systemctl status juicity-server.service --no-pager