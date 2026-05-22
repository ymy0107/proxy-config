# bash <(curl -fsSL https://get.hy2.io/)

cp /root/proxy-config/hysteria/config.yaml /etc/hysteria/config.yaml
systemctl enable hysteria
systemctl restart hysteria
systemctl status hysteria --no-pager