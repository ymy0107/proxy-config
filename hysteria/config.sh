# bash <(curl -fsSL https://get.hy2.io/)

# mkdir -p /etc/hysteria/certs
# cp /etc/letsencrypt/live/verygood.us.kg/fullchain.pem /etc/hysteria/certs/
# cp /etc/letsencrypt/live/verygood.us.kg/privkey.pem /etc/hysteria/certs/
# chown -R hysteria:hysteria /etc/hysteria/certs
# chmod 600 /etc/hysteria/certs/*

openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout /etc/hysteria/server.key \
  -out /etc/hysteria/server.crt \
  -days 3650 \
  -subj "/CN=109.107.140.76" \
  -addext "subjectAltName=IP:109.107.140.76"
cp /root/proxy-config/hysteria/config.yaml /etc/hysteria/config.yaml
systemctl enable hysteria-server
systemctl restart hysteria-server
systemctl status hysteria-server --no-pager