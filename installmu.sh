#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\e[0m'
purple() { echo -e "\\033[35;1m${*}\\033[0m"; }
tyblue() { echo -e "\\033[36;1m${*}\\033[0m"; }
yellow() { echo -e "\\033[33;1m${*}\\033[0m"; }
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }
cd /root
#System version number
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi

#install ssh ovpn
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green      Install SSH / WS               $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/projek10/main/ssh/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
sleep 2
clear

#Instal Xray
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green       Installer Xray               $NC"
echo -e "$green Install Vmess,Trojan,Vless,Shadowsoks  $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hideinst-xrayv5.sh && chmod +x hideinst-xrayv5.sh && ./hideinst-xrayv5.sh
sleep 2
clear


echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
echo -e "$green          Install Websocket              $NC"
echo -e "\e[33m━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m"
sleep 2
clear
wget https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
sleep 2
clear

#package tambahan addd aaccount

#Vmess/v2ray
wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-vray.sh" && chmod +x /usr/bin/add-ws
wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/hidessh99/projek10/main/cek-user.sh" && chmod +x /usr/bin/cek-ws
wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/bracoli/v4/main/xray/del-ws.sh" && chmod +x /usr/bin/del-ws
wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/bracoli/v4/main/xray/renew-ws.sh" && chmod +x /usr/bin/renew-ws

#Vless
wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-vless.sh" && chmod +x /usr/bin/add-vless
wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/bracoli/v4/main/xray/renew-vless.sh" && chmod +x /usr/bin/renew-vless
wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/bracoli/v4/main/xray/del-vless.sh" && chmod +x /usr/bin/del-vless
wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/hidessh99/projek10/main/cek-user.sh" && chmod +x /usr/bin/cek-vless

#trojan
wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-tr.sh" && chmod +x /usr/bin/add-tr
wget -q -O /usr/bin/addtrgo "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-tr.sh" && chmod +x /usr/bin/aaddtrgo

wget -q -O /usr/bin/del-tr "https://raw.githubusercontent.com/bracoli/v4/main/xray/del-tr.sh" && chmod +x /usr/bin/del-tr
wget -q -O /usr/bin/renew-tr "https://raw.githubusercontent.com/bracoli/v4/main/xray/renew-tr.sh" && chmod +x /usr/bin/renew-tr
wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/hidessh99/projek10/main/cek-user.sh" && chmod +x /usr/bin/cek-tr

#shadowsoksks
wget -q -O /usr/bin/add-ssws "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/hide-add-ss.sh" && chmod +x /usr/bin/add-ssws


wget -q -O /usr/bin/del-user "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/del-ws.sh" && chmod +x /usr/bin/del-user
wget -q -O /usr/bin/renew-user "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/renew-ws.sh" && chmod +x /usr/bin/renew-user
wget -q -O /usr/bin/crtv2ray "https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/xray/crt.sh" && chmod +x /usr/bin/crtv2ray

sleep 2



clear
cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.
if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi
mesg n || true
clear
menu
END
chmod 644 /root/.profile

if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi
history -c
echo $serverV > /opt/.ver
aureb=$(cat /home/re_otm)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
curl -sS ifconfig.me > /etc/myipvps
echo " "

echo "=====================-[ HideSSH ]-===================="
echo ""
echo "------------------------------------------------------------"
echo ""
echo ""
echo "   >>> Service & Port"  | tee -a log-install.txt
echo "   - OpenSSH                 : 22"  | tee -a log-install.txt
echo "   - SSH Websocket           : 80 [OFF]" | tee -a log-install.txt
echo "   - SSH SSL Websocket       : 443" | tee -a log-install.txt
echo "   - Stunnel4                : 447, 777" | tee -a log-install.txt
echo "   - Dropbear                : 109, 143" | tee -a log-install.txt
echo "   - Badvpn                  : 7100-7900" | tee -a log-install.txt
echo "   - Nginx                   : 81" | tee -a log-install.txt
echo "   - XRAY  Vmess TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vmess None TLS    : 80" | tee -a log-install.txt
echo "   - XRAY  Vless TLS         : 443" | tee -a log-install.txt
echo "   - XRAY  Vless None TLS    : 80" | tee -a log-install.txt
echo "   - Trojan GRPC                 : 443" | tee -a log-install.txt
echo "   - Trojan WS               : 443" | tee -a log-install.txt
echo "   - Sodosok WS/GRPC           : 443" | tee -a log-install.txt
echo ""  | tee -a log-install.txt
echo "   >>> Server Information & Other Features"  | tee -a log-install.txt
echo "   - Timezone                : Asia/Jakarta (GMT +7)"  | tee -a log-install.txt
echo "   - Fail2Ban                : [ON]"  | tee -a log-install.txt
echo "   - Dflate                  : [ON]"  | tee -a log-install.txt
echo "   - IPtables                : [ON]"  | tee -a log-install.txt
echo "   - Auto-Reboot             : [ON]"  | tee -a log-install.txt
echo "   - IPv6                    : [OFF]"  | tee -a log-install.txt
echo "   - Autoreboot On           : $aureb:00 $gg GMT +7" | tee -a log-install.txt
echo "   - Autobackup Data" | tee -a log-install.txt
echo "   - AutoKill Multi Login User" | tee -a log-install.txt
echo "   - Auto Delete Expired Account" | tee -a log-install.txt
echo "   - Fully automatic script" | tee -a log-install.txt
echo "   - VPS settings" | tee -a log-install.txt
echo "   - Admin Control" | tee -a log-install.txt
echo "   - Change port" | tee -a log-install.txt
echo "   - Restore Data" | tee -a log-install.txt
echo "   - Full Orders For Various Services" | tee -a log-install.txt
echo ""
echo "------------------------------------------------------------"
echo ""
echo "" | tee -a log-install.txt
rm /root/setup.sh >/dev/null 2>&1
rm /root/ins-xray.sh >/dev/null 2>&1
rm /root/insshws.sh >/dev/null 2>&1
cd
rm -rf updatek.sh
rm -rf dns-cf.sh
rm -rf update.sh
rm -rf dns-cf.sh.*
rm -rf update.sh.*
rm -rf updatek.sh.*
rm -rf hideinst-xrayv5.sh
rm -rf installmu.sh
rm -rf hideinst-xrayv5.sh.*
rm -rf installmu.sh.*
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
echo -e "
"
echo -ne "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
reboot
fi
fi
