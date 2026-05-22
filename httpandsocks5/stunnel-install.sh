apt install stunnel4 -y
openssl genrsa -out key.pem 2048
openssl req -new -x509 -key key.pem -out cert.pem -days 365 \
    -nodes -subj "/CN=this"
cat key.pem cert.pem > /etc/stunnel/stunnel.pem
rm key.pem cert.pem
cp /root/proxy-config/httpandsocks5/stunnel.conf /etc/stunnel/stunnel.conf
systemctl restart stunnel4
systemctl enable stunnel4
systemctl --no-pager status stunnel4
