# bash <(curl -fsSL https://get.hy2.io/)

cp /root/proxy-config/hysteria/config.yaml /etc/hysteria/config.yaml
systemctl enable hysteria-server
systemctl start hysteria-server
systemctl status hysteria-server --no-pager