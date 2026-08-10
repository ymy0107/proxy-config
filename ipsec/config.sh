# mkdir -p ~/ipsec_certs && cd ~/ipsec_certs

# # 1. 生成 CA 私钥和证书
# ipsec pki --gen --type rsa --size 4096 --outform pem > caKey.pem
# ipsec pki --self --ca --lifetime 3650 --in caKey.pem \
#   --dn "CN=My VPN CA" --outform pem > caCert.pem

# # 2. 生成服务器私钥和证书 (注意：替换 SERVER_IP 为你的实际公网 IP 或域名)
# ipsec pki --gen --type rsa --size 4096 --outform pem > serverKey.pem
# ipsec pki --pub --in serverKey.pem | ipsec pki --issue --cacert caCert.pem \
#   --cakey caKey.pem --lifetime 3650 --dn "CN=202.182.104.239" \
#   --san "202.182.104.239" --flag serverAuth --flag ikeIntermediate --outform pem > serverCert.pem

# # 3. 将证书复制到系统目录
# cp caCert.pem /etc/ipsec.d/cacerts/
# cp serverCert.pem /etc/ipsec.d/certs/
# cp serverKey.pem /etc/ipsec.d/private/

systemctl restart strongswan-starter
systemctl enable strongswan-starter
systemctl status strongswan-starter --no-pager