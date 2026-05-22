cd
clear
rm /root/proxy-config/httpandsocks5/0.9.5.tar.gz*
rm -rf /root/proxy-config/httpandsocks5/3proxy-0.9.5/

cd /root/proxy-config/httpandsocks5
wget https://github.com/3proxy/3proxy/archive/refs/tags/0.9.5.tar.gz
tar -xvzf 0.9.5.tar.gz
cd 3proxy-0.9.5/
make -f Makefile.Linux -j4
make -f Makefile.Linux install -j4

cd
cp /root/proxy-config/httpandsocks5/3proxy-conf/3proxy.cfg /etc/3proxy/conf/3proxy.cfg
cp /root/proxy-config/httpandsocks5/3proxy-conf/passwd /etc/3proxy/conf/passwd

# cp /root/3proxy.cfg /etc/3proxy/conf/3proxy.cfg
systemctl enable 3proxy.service
systemctl restart 3proxy.service
systemctl --no-pager status 3proxy.service