apt update
apt install git make gcc build-essential jq net-tools -y

clear
cd
rm -rf proxy-config
git clone https://github.com/ymy0107/proxy-config.git
find . -name "*.sh" -exec chmod +x {} +

clear
cd
cd proxy-config
git fetch --all
git reset --hard origin/main
find . -name "*.sh" -exec chmod +x {} +


ufw --force reset
ufw deny from 36.112.122.97 to any port 22
ufw default allow incoming
ufw default allow outgoing
ufw --force enable

ufw --force reset
ufw default deny incoming
ufw default allow outgoing
ufw allow 22/tcp
ufw allow 1194/tcp
ufw allow 8388/tcp
ufw allow 1194/udp
ufw allow 5443/udp
ufw --force enable