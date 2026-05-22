# bash <(curl -fsSL https://get.hy2.io/)

# mkdir -p /etc/hysteria/certs
# cp /etc/letsencrypt/live/verygood.us.kg/fullchain.pem /etc/hysteria/certs/
# cp /etc/letsencrypt/live/verygood.us.kg/privkey.pem /etc/hysteria/certs/
# chown -R hysteria:hysteria /etc/hysteria/certs
# chmod 600 /etc/hysteria/certs/*
cp /root/proxy-config/hysteria/config.yaml /etc/hysteria/config.yaml
systemctl enable hysteria-server
systemctl restart hysteria-server
systemctl status hysteria-server --no-pager