#!/bin/bash
echo -e "
"
date
echo ""
domain=$(cat /root/domain)
sleep 1
mkdir -p /etc/xray 
echo -e "[ ${green}INFO${NC} ] Checking... "
apt install iptables iptables-persistent -y
sleep 1
echo -e "[ ${green}INFO$NC ] Setting ntpdate"
ntpdate pool.ntp.org 
timedatectl set-ntp true
sleep 1
echo -e "[ ${green}INFO$NC ] Enable chronyd"
systemctl enable chronyd
systemctl restart chronyd
sleep 1
echo -e "[ ${green}INFO$NC ] Enable chrony"
systemctl enable chrony
systemctl restart chrony
timedatectl set-timezone Asia/Jakarta
sleep 1
echo -e "[ ${green}INFO$NC ] Setting chrony tracking"
chronyc sourcestats -v
chronyc tracking -v
echo -e "[ ${green}INFO$NC ] Setting dll"
apt clean all && apt update
apt install curl socat xz-utils wget apt-transport-https gnupg gnupg2 gnupg1 dnsutils lsb-release -y 
apt install socat cron bash-completion ntpdate -y
ntpdate pool.ntp.org
apt -y install chrony
apt install zip -y
apt install curl pwgen openssl netcat cron -y


# install xray
sleep 1
echo -e "[ ${green}INFO$NC ] Downloading & Installing xray core"
domainSock_dir="/run/xray";! [ -d $domainSock_dir ] && mkdir  $domainSock_dir
chown www-data.www-data $domainSock_dir
# Make Folder XRay
mkdir -p /var/log/xray
mkdir -p /etc/xray
chown www-data.www-data /var/log/xray
chmod +x /var/log/xray
touch /var/log/xray/access.log
touch /var/log/xray/error.log
touch /var/log/xray/access2.log
touch /var/log/xray/error2.log
touch /var/log/xray/error2.log

#tambahan xray 
touch /var/log/xray/vmess-ws.log
touch /var/log/xray/vmess-grpc.log
touch /var/log/xray/vmess-tcp.log

touch /var/log/xray/vless-ws.log
touch /var/log/xray/vless-grpc.log

touch /var/log/xray/trojan-tcp.log
touch /var/log/xray/trojan-grpc.log
touch /var/log/xray/trojan-ws.log

# / / Ambil Xray Core Version Terbaru
bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install -u www-data --version 1.5.6

## crt xray
systemctl stop nginx
mkdir /root/.acme.sh
curl https://acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
chmod +x /root/.acme.sh/acme.sh
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /etc/xray/xray.crt --keypath /etc/xray/xray.key --ecc

# nginx renew ssl
echo -n '#!/bin/bash
/etc/init.d/nginx stop
"/root/.acme.sh"/acme.sh --cron --home "/root/.acme.sh" &> /root/renew_ssl.log
/etc/init.d/nginx start
/etc/init.d/nginx status
' > /usr/local/bin/ssl_renew.sh
chmod +x /usr/local/bin/ssl_renew.sh
if ! grep -q 'ssl_renew.sh' /var/spool/cron/crontabs/root;then (crontab -l;echo "15 03 */3 * * /usr/local/bin/ssl_renew.sh") | crontab;fi

mkdir -p /home/vps/public_html

# set uuid
uuid=$(cat /proc/sys/kernel/random/uuid)


# vmess wss port 31298
cd
wget -O /etc/xray/vmess-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/vmess-ws.json && chmod +x /etc/xray/vmess-ws.json
wget -O /etc/systemd/system/vmess-ws.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vmess-ws.service && chmod +x /etc/systemd/system/vmess-ws.service
#reboot service
systemctl daemon-reload
systemctl enable vmess-ws.service
systemctl start vmess-ws.service
systemctl restart vmess-ws.service
clear


# vmess tcp port 80 eror domain belum diubah
cd
wget -O /etc/xray/vmess-ws-none.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/vmess-ws-none.json && chmod +x /etc/xray/vmess-ws-none.json
wget -O /etc/systemd/system/vmess-ws-none.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vmess-ws-none.service && chmod +x /etc/systemd/system/vmess-ws-none.service
#reboot service
systemctl daemon-reload
systemctl enable vmess-ws-none.service
systemctl start vmess-ws-none.service
systemctl restart vmess-ws-none.service
clear

# vmess grpc port 31303
cd
wget -O /etc/xray/vmess-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/vmess-grpc.json && chmod +x /etc/xray/vmess-grpc.json
wget -O /etc/systemd/system/vmess-grpc.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vmess-grpc.service && chmod +x /etc/systemd/system/vmess-grpc.service
#reboot service
systemctl daemon-reload
systemctl enable vmess-grpc.service
systemctl start vmess-grpc.service
systemctl restart vmess-grpc.service
clear


# vless wss port 31297
cd
wget -O /etc/xray/vless-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/vless-ws.json && chmod +x /etc/xray/vless-ws.json
wget -O /etc/systemd/system/vless-ws.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vless-ws.service && chmod +x /etc/systemd/system/vless-ws.service
#reboot service
systemctl daemon-reload
systemctl enable vless-ws.service
systemctl start vless-ws.service
systemctl restart vless-ws.service
clear

# vless gprc port 31301
cd
wget -O /etc/xray/vless-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/vless-grpc.json && chmod +x /etc/xray/vless-grpc.json
wget -O /etc/systemd/system/vless-grpc.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vless-grpc.service && chmod +x /etc/systemd/system/vless-grpc.service
#reboot service
systemctl daemon-reload
systemctl enable vless-grpc.service
systemctl start vless-grpc.service
systemctl restart vless-grpc.service
clear


# trojan tcp port 443
cd
wget -O /etc/xray/trojan-tcp.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/trojan-tcp.json && chmod +x /etc/xray/trojan-tcp.json
wget -O /etc/systemd/system/trojan-tcp.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/trojan-tcp.service && chmod +x /etc/systemd/system/trojan-tcp.service
#reboot service
systemctl daemon-reload
systemctl enable trojan-tcp.service
systemctl start trojan-tcp.service
systemctl restart trojan-tcp.service
clear

# trojan wss port 60002
cd
wget -O /etc/xray/trojan-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/trojan-ws.json && chmod +x /etc/xray/trojan-ws.json
wget -O /etc/systemd/system/trojan-ws.service  https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/trojan-ws.service && chmod +x /etc/systemd/system/trojan-ws.service 
#reboot service
systemctl daemon-reload
systemctl enable trojan-ws.service 
systemctl start trojan-ws.service 
systemctl restart trojan-ws.service 
clear


# trojan gprc port 31304
cd
wget -O /etc/xray/trojan-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/coba/trojan-grpc.json && chmod +x /etc/xray/trojan-grpc.json
wget -O /etc/systemd/system/trojan-grpc.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/trojan-grpc.service && chmod +x /etc/systemd/system/trojan-grpc.service
#reboot service
systemctl daemon-reload
systemctl enable trojan-grpc.service
systemctl start trojan-grpc.service
systemctl restart trojan-grpc.service
clear
