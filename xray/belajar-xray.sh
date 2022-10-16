#!/bin/bash

echo - e "
"
date
echo ""
domain = $(cat / root / domain)
sleep 1
mkdir - p / etc / xray
echo - e "[ ${green}INFO${NC} ] Checking... "
apt install iptables iptables - persistent - y
sleep 1
echo - e "[ ${green}INFO$NC ] Setting ntpdate"
ntpdate pool.ntp.org
timedatectl set - ntp true
sleep 1
echo - e "[ ${green}INFO$NC ] Enable chronyd"
systemctl enable chronyd
systemctl restart chronyd
sleep 1
echo - e "[ ${green}INFO$NC ] Enable chrony"
systemctl enable chrony
systemctl restart chrony
timedatectl set - timezone Asia / Jakarta
sleep 1
echo - e "[ ${green}INFO$NC ] Setting chrony tracking"
chronyc sourcestats - v
chronyc tracking - v
echo - e "[ ${green}INFO$NC ] Setting dll"
apt clean all && apt update
apt install curl socat xz - utils wget apt - transport - https gnupg gnupg2 gnupg1 dnsutils lsb - release - y
apt install socat cron bash - completion ntpdate - y
ntpdate pool.ntp.org
apt - y install chrony
apt install zip - y
apt install curl pwgen openssl netcat cron - y


# install xray
sleep 1
echo - e "[ ${green}INFO$NC ] Downloading & Installing xray core"
domainSock_dir = "/run/xray";
![-d $domainSock_dir] && mkdir $domainSock_dir
chown www - data.www - data $domainSock_dir# Make Folder XRay
mkdir - p /
    var / log / xray
mkdir - p / etc / xray
chown www - data.www - data /
    var / log / xray
chmod + x /
    var / log / xray
touch /
    var / log / xray / access.log
touch /
    var / log / xray / error.log
touch /
    var / log / xray / access2.log
touch /
    var / log / xray / error2.log# / / Ambil Xray Core Version Terbaru
bash - c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)"
@ install - u www - data--version 1.5 .6



## crt xray
systemctl stop nginx
mkdir / root / .acme.sh
curl https: //acme-install.netlify.app/acme.sh -o /root/.acme.sh/acme.sh
    chmod + x / root / .acme.sh / acme.sh /
    root / .acme.sh / acme.sh--upgrade--auto - upgrade /
    root / .acme.sh / acme.sh--set -
    default -ca--server letsencrypt /
    root / .acme.sh / acme.sh--issue - d $domain--standalone - k ec - 256~/.acme.sh/acme.sh--installcert - d $domain--fullchainpath / etc / xray / xray.crt--keypath / etc / xray / xray.key--ecc

# nginx renew ssl
echo - n '#!/bin/bash /
etc / init.d / nginx stop "/root/.acme.sh" / acme.sh--cron--home "/root/.acme.sh" & > /root/renew_ssl.log /
    etc / init.d / nginx start /
    etc / init.d / nginx status ' > /usr/local/bin/ssl_renew.sh
chmod + x / usr / local / bin / ssl_renew.sh
if !grep - q 'ssl_renew.sh' /
    var / spool / cron / crontabs / root;
then(crontab - l; echo "15 03 */3 * * /usr/local/bin/ssl_renew.sh") | crontab;
fi

mkdir - p / home / vps / public_html

#set uuid
uuid=$(cat /proc/sys/kernel/random/uuid);
uuid2="s/xxxxxxxxx/$uuid/g";

#json vmess wss port 23456
wget -O /etc/xray/vmess-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/vmess-ws.json && chmod +x /etc/xray/vmess-ws.json
wget -O /etc/systemd/system/vmess-ws.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vmess-ws.service && chmod +x /etc/systemd/system/vmess-ws.service
sed -i $uuid2 /etc/xray/vmess-ws.json

#json vmess gprc port 31234
wget -O /etc/xray/vmess-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/vmess-grpc.json && chmod +x /etc/xray/vmess-grpc.json
wget -O /etc/systemd/system/vmess-grpc.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vmess-grpc.service && chmod +x /etc/systemd/system/vmess-grpc.service
sed -i $uuid2 /etc/xray/vmess-grpc.json

#json vless wss port 14016
wget -O /etc/xray/vless-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/vless-ws.json && chmod +x /etc/xray/vless-ws.json
wget -O /etc/systemd/system/vless-ws.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vless-ws.service && chmod +x /etc/systemd/system/vless-ws.service
sed -i $uuid2 /etc/xray/vless-ws.json

#json vless gprc port 24456
wget -O /etc/xray/vless-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/vless-grpc.json && chmod +x /etc/xray/vless-grpc.json
wget -O /etc/systemd/system/vless-grpc.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/vless-grpc.service && chmod +x /etc/systemd/system/vless-grpc.service
sed -i $uuid2 /etc/xray/vless-grpc.json

#json trojan wss port 25432
wget -O /etc/xray/trojan-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/trojan-ws.json && chmod +x /etc/xray/trojan-ws.json
wget -O /etc/systemd/system/trojan-ws.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/trojan-ws.service && chmod +x /etc/systemd/system/trojan-ws.service
sed -i $uuid2 /etc/xray/trojan-ws.json

#json trojan gprc port 33456
wget -O /etc/xray/trojan-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/trojan-grpc.json && chmod +x /etc/xray/trojan-grpc.json
wget -O /etc/systemd/system/trojan-grpc.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/trojan-grpc.service && chmod +x /etc/systemd/system/trojan-grpc.service
sed -i $uuid2 /etc/xray/trojan-grpc.json 

#json shadowsoks wss port 30300
wget -O /etc/xray/shadowsocks-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/shadowsocks-ws.json && chmod +x /etc/xray/shadowsocks-ws.json
wget -O /etc/systemd/system/shadowsocks-ws.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/shadowsocks-ws.service && chmod +x /etc/systemd/system/shadowsocks-ws.service
sed -i $uuid2 /etc/xray/shadowsocks-ws.json 

#json shadowsoks gprc port 30310
wget -O /etc/xray/shadowsocks-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/shadowsocks-grpc.json && chmod +x /etc/xray/shadowsocks-grpc.json
wget -O /etc/systemd/system/shadowsocks-grpc.service https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/service/shadowsocks-grpc.service && chmod +x /etc/systemd/system/shadowsocks-grpc.service
sed -i $uuid2 /etc/xray/shadowsocks-grpc.json 

rm - rf / etc / systemd / system / xray.service.d
rm - rf / etc / systemd / system / xray @.service


# nginx config
cat > /etc/nginx / conf.d / xray.conf << EOF
server {
    listen 80;
    listen[::]: 80;
    listen 443 ssl http2 reuseport;
    listen[::]: 443 http2 reuseport;
    server_name $domain;
    ssl_certificate / etc / xray / xray.crt;
    ssl_certificate_key / etc / xray / xray.key;
    ssl_ciphers EECDH + CHACHA20: EECDH + CHACHA20 - draft: EECDH + ECDSA + AES128: EECDH + aRSA + AES128: RSA + AES128: EECDH + ECDSA + AES256: EECDH + aRSA + AES256: RSA + AES256: EECDH + ECDSA + 3 DES: EECDH + aRSA + 3 DES: RSA + 3 DES: !MD5;
    ssl_protocols TLSv1 .1 TLSv1 .2 TLSv1 .3;
    root / home / vps / public_html;
}
EOF

sed - i '$ ilocation = /hidessh-vless' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_pass http://127.0.0.1:14016;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_http_version 1.1;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Upgrade \$http_upgrade;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Connection "upgrade";' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation = /hidessh-vmess' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_pass http://127.0.0.1:23456;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_http_version 1.1;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Upgrade \$http_upgrade;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Connection "upgrade";' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation = /hidessh-trojan-ws' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_pass http://127.0.0.1:25432;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_http_version 1.1;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Upgrade \$http_upgrade;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Connection "upgrade";' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation = /hidessh-ss-ws' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_pass http://127.0.0.1:30300;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_http_version 1.1;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Upgrade \$http_upgrade;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Connection "upgrade";' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation /' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_pass http://127.0.0.1:700;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_http_version 1.1;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Upgrade \$http_upgrade;' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Connection "upgrade";' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation ^~ /vless-grpc' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_pass grpc://127.0.0.1:24456;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation ^~ /vmess-grpc' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_pass grpc://127.0.0.1:31234;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation ^~ /trojan-grpc' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_pass grpc://127.0.0.1:33456;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

sed - i '$ ilocation ^~ /ss-grpc' / etc / nginx / conf.d / xray.conf
sed - i '$ i{' / etc / nginx / conf.d / xray.conf
sed - i '$ iproxy_redirect off;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Real-IP \$remote_addr;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_set_header Host \$http_host;' / etc / nginx / conf.d / xray.conf
sed - i '$ igrpc_pass grpc://127.0.0.1:30310;' / etc / nginx / conf.d / xray.conf
sed - i '$ i}' / etc / nginx / conf.d / xray.conf

echo - e "$yell[SERVICE]$NC Restart All service"
systemctl daemon - reload
sleep 1
echo - e "[ ${green}ok${NC} ] Enable & restart xray "
systemctl daemin - reload

#systemctl enable xray
#systemctl restart xray
#reload deamon

systemctl enable vmess-ws
systemctl restart vmess-ws
systemctl enable vmess-grpc
systemctl restart vmess-grpc

systemctl enable vless-ws
systemctl restart vless-ws
systemctl enable vless-grpc
systemctl restart vless-grpc

systemctl enable trojan-ws
systemctl restart trojan-ws
systemctl enable trojan-grpc
systemctl restart trojan-grpc

systemctl enable shadowsocks-ws
systemctl restart shadowsocks-ws
systemctl enable shadowsocks-grpc
systemctl restart shadowsocks-grpc

systemctl restart nginx


sleep 1
yellow() {
    echo - e "\\033[33;1m${*}\\033[0m";
}
yellow "xray/Vmess"
yellow "xray/Vless"

mv / root / domain / etc / xray /
    if [-f / root / scdomain];
then
rm / root / scdomain > /dev/null
2 > & 1
fi
clear
rm - f ins - xray.sh
