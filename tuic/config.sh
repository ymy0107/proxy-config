cp /etc/letsencrypt/live/verygood.us.kg/fullchain.pem /root/.config/mihomo/fullchain.pem
cp /etc/letsencrypt/live/verygood.us.kg/privkey.pem /root/.config/mihomo/privkey.pem
cp /root/proxy-config/tuic/config.yaml /root/.config/mihomo/config.yaml
cp /root/proxy-config/mihomo/mihomo.service /etc/systemd/system/mihomo.service
systemctl daemon-reload
systemctl enable mihomo.service
systemctl restart mihomo.service
systemctl status mihomo.service --no-pager