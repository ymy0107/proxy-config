bash <(curl -fsSL https://get.hy2.io/)

mkdir -p /etc/hysteria/certs
cp /etc/letsencrypt/live/japan.qqwllkmn.qzz.io/fullchain.pem /etc/hysteria/certs/
cp /etc/letsencrypt/live/japan.qqwllkmn.qzz.io/privkey.pem /etc/hysteria/certs/
chown -R hysteria:hysteria /etc/hysteria/certs
chmod 600 /etc/hysteria/certs/*

openssl req -x509 -nodes -newkey rsa:2048 \
  -keyout /etc/hysteria/server.key \
  -out /etc/hysteria/server.crt \
  -days 3650 \
  -subj "/CN=202.182.104.239" \
  -addext "subjectAltName=IP:202.182.104.239"
cp /root/proxy-config/hysteria/config.yaml /etc/hysteria/config.yaml
systemctl enable hysteria-server
systemctl restart hysteria-server
systemctl status hysteria-server --no-pager