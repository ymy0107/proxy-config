wget https://github.com/MetaCubeX/mihomo/releases/download/v1.19.25/mihomo-linux-amd64-v3-v1.19.25.gz
gunzip mihomo-linux-amd64-v3-v1.19.25.gz
chmod +x mihomo-linux-amd64-v3-v1.19.25
cp mihomo-linux-amd64-v3-v1.19.25 /usr/local/bin/mihomo
# mkdir /etc/mihomo
# cp /root/proxy-config/mihomo/config.yaml /etc/mihomo/config.yaml
# cp /root/proxy-config/mihomo/mihomo.service /etc/systemd/system/mihomo.service
# systemctl daemon-reload
# systemctl enable mihomo.service
# systemctl restart mihomo.service