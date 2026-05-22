cp /root/proxy-config/vmessandvless/v2ray-linux-64/v2ray /usr/local/bin/v2ray
cp /root/proxy-config/vmessandvless/v2ray-linux-64/config.json /usr/local/etc/v2ray/config.json
cp /root/proxy-config/vmessandvless/v2ray-linux-64/systemd/system/v2ray.service /etc/systemd/system/v2ray.service

systemctl daemon-reload
systemctl enable v2ray
systemctl start v2ray
systemctl status v2ray --no-pager