mkdir /etc/mihomo
cp /root/proxy-config/tuic/config.yaml /etc/mihomo/config.yaml
cp /root/proxy-config/mihomo/mihomo.service /etc/systemd/system/mihomo.service
systemctl daemon-reload
systemctl enable mihomo.service
systemctl restart mihomo.service