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


