#!/bin/bash
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

red='\e[1;31m'
green='\e[1;32m'
yell='\e[1;33m'
NC='\e[0m'
green() { echo -e "\\033[32;1m${*}\\033[0m"; }
red() { echo -e "\\033[31;1m${*}\\033[0m"; }




cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
screen -r upds
END
chmod 644 /root/.profile

if [ -d "/etc/user-update/" ]; then
rm -rf /etc/user-update/ > /dev/null 2>&1
fi

MYIP=$(curl -sS ipv4.icanhazip.com)
NameUser=$(curl -sS https://raw.githubusercontent.com/apih46/access/main/ip | grep $MYIP | awk '{print $2}')
cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
clear

serverV=$( curl -sS https://raw.githubusercontent.com/apih46/access/main/versi  )
if [[  $(cat /opt/.ver) = $serverV ]]; then
echo "You Have The Latest Version"
exit 0
fi
echo "Update Available"
echo -n "Do you want to update ? (y/n)? "
read answer
if [ "$answer" == "${answer#[Yy]}" ] ;then
exit 0
else
clear
fi
systemctl stop cron > /dev/null 2>&1
curl -sS https://raw.githubusercontent.com/bracoli/g/main/resources/ascii-home
echo
sleep 1
date
echo 
echo
echo -e "[ ${green}INFO${NC} ] Checking... "
sleep 1

#update ssh
Updater_ALL () {
echo -e "[ ${green}INFO${NC} ] Updating ssh ..."
    wget -q -O /usr/bin/usernew "https://raw.githubusercontent.com/bracoli/g/main/ssh/usernew.sh" && chmod +x /usr/bin/usernew
    wget -q -O /usr/bin/trial "https://raw.githubusercontent.com/bracoli/g/main/ssh/trial.sh" && chmod +x /usr/bin/trial
    wget -q -O /usr/bin/hapus "https://raw.githubusercontent.com/bracoli/g/main/ssh/hapus.sh" && chmod +x /usr/bin/hapus
    wget -q -O /usr/bin/member "https://raw.githubusercontent.com/bracoli/g/main/ssh/member.sh" && chmod +x /usr/bin/member
    wget -q -O /usr/bin/delete "https://raw.githubusercontent.com/bracoli/g/main/ssh/delete.sh" && chmod +x /usr/bin/delete
    wget -q -O /usr/bin/cek "https://raw.githubusercontent.com/bracoli/g/main/ssh/cek.sh" && chmod +x /usr/bin/cek
    wget -q -O /usr/bin/restart "https://raw.githubusercontent.com/bracoli/g/main/ssh/restart.sh" && chmod +x /usr/bin/restart
    wget -q -O /usr/bin/renew "https://raw.githubusercontent.com/bracoli/g/main/ssh/renew.sh" && chmod +x /usr/bin/renew
    wget -q -O /usr/bin/autokill "https://raw.githubusercontent.com/bracoli/g/main/ssh/autokill.sh" && chmod +x /usr/bin/autokill
    wget -q -O /usr/bin/ceklim "https://raw.githubusercontent.com/bracoli/g/main/ssh/ceklim.sh" && chmod +x /usr/bin/ceklim
    wget -q -O /usr/bin/tendang "https://raw.githubusercontent.com/bracoli/g/main/ssh/tendang.sh" && chmod +x /usr/bin/tendang
    wget -q -O /usr/bin/port-dropbear "https://raw.githubusercontent.com/bracoli/g/main/ssh/port-dropbear.sh" && chmod +x /usr/bin/port-dropbear
    wget -q -O /usr/bin/port-ovpn "https://raw.githubusercontent.com/bracoli/g/main/ssh/port-ovpn.sh" && chmod +x /usr/bin/port-ovpn
    wget -q -O /usr/bin/port-ssl "https://raw.githubusercontent.com/bracoli/g/main/ssh/port-ssl.sh" && chmod +x /usr/bin/port-ssl
    wget -q -O /usr/bin/banner "https://raw.githubusercontent.com/bracoli/g/main/banner/banner.sh" && chmod +x /usr/bin/banner
    wget -q -O /usr/bin/sshws "https://raw.githubusercontent.com/bracoli/g/main/ssh/ins-sshws.sh" && chmod +x /usr/bin/sshws
    wget -q -O /usr/bin/ssh-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/ssh-menu.sh" && chmod +x /usr/bin/ssh-menu
    wget -q -O /usr/bin/proxy3.js "https://raw.githubusercontent.com/bracoli/g/main/ssh/proxy3.js"
    wget -q -O /usr/bin/ssh-wsenabler "https://raw.githubusercontent.com/bracoli/g/main/ssh/sshws-true.sh" && chmod +x /usr/bin/ssh-wsenabler
    wget -q -O /usr/bin/port-wssl "https://raw.githubusercontent.com/bracoli/g/main/ssh/port-ws-ssl.sh" && chmod +x /usr/bin/port-wssl
    wget -q -O /usr/bin/portohp "https://raw.githubusercontent.com/bracoli/g/main/ssh/portohp.sh" && chmod +x /usr/bin/portohp

echo -e "[ ${green}INFO${NC} ] Updating v2ray ..."
    if [ "$cekray" = "XRAY" ]; then
    #Update Xray
    wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/bracoli/g/main/xray/add-ws.sh" && chmod +x /usr/bin/add-ws
    wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/bracoli/g/main/xray/add-vless.sh" && chmod +x /usr/bin/add-vless
    wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/bracoli/g/main/xray/add-tr.sh" && chmod +x /usr/bin/add-tr
    wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/bracoli/g/main/xray/del-ws.sh" && chmod +x /usr/bin/del-ws
    wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/bracoli/g/main/xray/del-vless.sh" && chmod +x /usr/bin/del-vless
    wget -q -O /usr/bin/del-tr "https://raw.githubusercontent.com/bracoli/g/main/xray/del-tr.sh" && chmod +x /usr/bin/del-tr
    wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/bracoli/g/main/xray/cek-ws.sh" && chmod +x /usr/bin/cek-ws
    wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/bracoli/g/main/xray/cek-vless.sh" && chmod +x /usr/bin/cek-vless
    wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/bracoli/g/main/xray/cek-tr.sh" && chmod +x /usr/bin/cek-tr
    wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/bracoli/g/main/xray/renew-ws.sh" && chmod +x /usr/bin/renew-ws
    wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/bracoli/g/main/xray/renew-vless.sh" && chmod +x /usr/bin/renew-vless
    wget -q -O /usr/bin/renew-tr "https://raw.githubusercontent.com/bracoli/g/main/xray/renew-tr.sh" && chmod +x /usr/bin/renew-tr
    wget -q -O /usr/bin/trial-ws "https://raw.githubusercontent.com/bracoli/g/main/xray/trial-ws.sh" && chmod +x /usr/bin/trial-ws
    wget -q -O /usr/bin/trial-vless "https://raw.githubusercontent.com/bracoli/g/main/xray/trial-vless.sh" && chmod +x /usr/bin/trial-vless
    wget -q -O /usr/bin/trial-tr "https://raw.githubusercontent.com/bracoli/g/main/xray/trial-tr.sh" && chmod +x /usr/bin/trial-tr
    wget -q -O /usr/bin/port-ws "https://raw.githubusercontent.com/bracoli/g/main/xray/port-ws.sh" && chmod +x /usr/bin/port-ws
    wget -q -O /usr/bin/port-vless "https://raw.githubusercontent.com/bracoli/g/main/xray/port-vless.sh" && chmod +x /usr/bin/port-vless
    wget -q -O /usr/bin/port-tr "https://raw.githubusercontent.com/bracoli/g/main/xray/port-tr.sh" && chmod +x /usr/bin/port-tr
    wget -q -O /usr/bin/renewcert "https://raw.githubusercontent.com/bracoli/g/main/xray/cert.sh" && chmod +x /usr/bin/renewcert
    wget -q -O /usr/bin/add-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/add-trgo.sh" && chmod +x /usr/bin/add-trgo
    wget -q -O /usr/bin/renew-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/renew-trgo.sh" && chmod +x /usr/bin/renew-trgo
    wget -q -O /usr/bin/cek-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/cek-trgo.sh" && chmod +x /usr/bin/cek-trgo
    wget -q -O /usr/bin/del-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/del-trgo.sh" && chmod +x /usr/bin/del-trgo
    wget -q -O /usr/bin/trial-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/trial-trgo.sh" && chmod +x /usr/bin/trial-trgo
    wget -q -O /usr/bin/port-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/port-trgo.sh" && chmod +x /usr/bin/port-trgo
    wget -q -O /usr/bin/v2ray-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/v2ray-menu.sh" && chmod +x /usr/bin/v2ray-menu
    wget -q -O /usr/bin/trojan-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/trojan-menu.sh" && chmod +x /usr/bin/trojan-menu
    else
    #Update v2ray
    wget -q -O /usr/bin/add-ws "https://raw.githubusercontent.com/bracoli/g/main/v2ray/add-ws.sh" && chmod +x /usr/bin/add-ws
    wget -q -O /usr/bin/add-vless "https://raw.githubusercontent.com/bracoli/g/main/v2ray/add-vless.sh" && chmod +x /usr/bin/add-vless
    wget -q -O /usr/bin/add-tr "https://raw.githubusercontent.com/bracoli/g/main/trojan/add-tr.sh" && chmod +x /usr/bin/add-tr
    wget -q -O /usr/bin/del-ws "https://raw.githubusercontent.com/bracoli/g/main/v2ray/del-ws.sh" && chmod +x /usr/bin/del-ws
    wget -q -O /usr/bin/del-vless "https://raw.githubusercontent.com/bracoli/g/main/v2ray/del-vless.sh" && chmod +x /usr/bin/del-vless
    wget -q -O /usr/bin/del-tr "https://raw.githubusercontent.com/bracoli/g/main/trojan/del-tr.sh" && chmod +x /usr/bin/del-tr
    wget -q -O /usr/bin/cek-ws "https://raw.githubusercontent.com/bracoli/g/main/v2ray/cek-ws.sh" && chmod +x /usr/bin/cek-ws
    wget -q -O /usr/bin/cek-vless "https://raw.githubusercontent.com/bracoli/g/main/v2ray/cek-vless.sh" && chmod +x /usr/bin/cek-vless
    wget -q -O /usr/bin/cek-tr "https://raw.githubusercontent.com/bracoli/g/main/trojan/cek-tr.sh" && chmod +x /usr/bin/cek-tr
    wget -q -O /usr/bin/renew-ws "https://raw.githubusercontent.com/bracoli/g/main/v2ray/renew-ws.sh" && chmod +x /usr/bin/renew-ws
    wget -q -O /usr/bin/renew-vless "https://raw.githubusercontent.com/bracoli/g/main/v2ray/renew-vless.sh" && chmod +x /usr/bin/renew-vless
    wget -q -O /usr/bin/renew-tr "https://raw.githubusercontent.com/bracoli/g/main/trojan/renew-tr.sh" && chmod +x /usr/bin/renew-tr
    wget -q -O /usr/bin/trial-ws "https://raw.githubusercontent.com/bracoli/g/main/v2ray/trial-ws.sh" && chmod +x /usr/bin/trial-ws
    wget -q -O /usr/bin/trial-vless "https://raw.githubusercontent.com/bracoli/g/main/v2ray/trial-vless.sh" && chmod +x /usr/bin/trial-vless
    wget -q -O /usr/bin/trial-tr "https://raw.githubusercontent.com/bracoli/g/main/trojan/trial-tr.sh" && chmod +x /usr/bin/trial-tr
    wget -q -O /usr/bin/port-ws "https://raw.githubusercontent.com/bracoli/g/main/v2ray/port-ws.sh" && chmod +x /usr/bin/port-ws
    wget -q -O /usr/bin/port-vless "https://raw.githubusercontent.com/bracoli/g/main/v2ray/port-vless.sh" && chmod +x /usr/bin/port-vless
    wget -q -O /usr/bin/port-tr "https://raw.githubusercontent.com/bracoli/g/main/trojan/port-tr.sh" && chmod +x /usr/bin/port-tr
    wget -q -O /usr/bin/renewcert "https://raw.githubusercontent.com/bracoli/g/main/v2ray/cert.sh" && chmod +x /usr/bin/renewcert
    wget -q -O /usr/bin/add-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/add-trgo.sh" && chmod +x /usr/bin/add-trgo
    wget -q -O /usr/bin/renew-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/renew-trgo.sh" && chmod +x /usr/bin/renew-trgo
    wget -q -O /usr/bin/cek-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/cek-trgo.sh" && chmod +x /usr/bin/cek-trgo
    wget -q -O /usr/bin/del-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/del-trgo.sh" && chmod +x /usr/bin/del-trgo
    wget -q -O /usr/bin/trial-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/trial-trgo.sh" && chmod +x /usr/bin/trial-trgo
    wget -q -O /usr/bin/port-trgo "https://raw.githubusercontent.com/bracoli/g/main/trojan/port-trgo.sh" && chmod +x /usr/bin/port-trgo
    wget -q -O /usr/bin/v2ray-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/v2ray-menu.sh" && chmod +x /usr/bin/v2ray-menu
    wget -q -O /usr/bin/trojan-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/trojan-menu.sh" && chmod +x /usr/bin/trojan-menu
    fi
echo -e "[ ${green}INFO${NC} ] Updating wireguard ..."
    #Update WG
    wget -q -O /usr/bin/add-wg "https://raw.githubusercontent.com/bracoli/g/main/wireguard/add-wg.sh" && chmod +x /usr/bin/add-wg
    wget -q -O /usr/bin/del-wg "https://raw.githubusercontent.com/bracoli/g/main/wireguard/del-wg.sh" && chmod +x /usr/bin/del-wg
    wget -q -O /usr/bin/cek-wg "https://raw.githubusercontent.com/bracoli/g/main/wireguard/cek-wg.sh" && chmod +x /usr/bin/cek-wg
    wget -q -O /usr/bin/renew-wg "https://raw.githubusercontent.com/bracoli/g/main/wireguard/renew-wg.sh" && chmod +x /usr/bin/renew-wg
    wget -q -O /usr/bin/trial-wg "https://raw.githubusercontent.com/bracoli/g/main/wireguard/trial-wg.sh" && chmod +x /usr/bin/trial-wg
    wget -q -O /usr/bin/port-wg "https://raw.githubusercontent.com/bracoli/g/main/wireguard/port-wg.sh" && chmod +x /usr/bin/port-wg
    wget -q -O /usr/bin/wg-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/wg-menu.sh" && chmod +x /usr/bin/wg-menu
echo -e "[ ${green}INFO${NC} ] Updating sstp ..."
    #Update SSTP
    wget -q -O /usr/bin/add-sstp "https://raw.githubusercontent.com/bracoli/g/main/sstp/add-sstp.sh" && chmod +x /usr/bin/add-sstp
    wget -q -O /usr/bin/del-sstp "https://raw.githubusercontent.com/bracoli/g/main/sstp/del-sstp.sh" && chmod +x /usr/bin/del-sstp
    wget -q -O /usr/bin/cek-sstp "https://raw.githubusercontent.com/bracoli/g/main/sstp/cek-sstp.sh" && chmod +x /usr/bin/cek-sstp
    wget -q -O /usr/bin/renew-sstp "https://raw.githubusercontent.com/bracoli/g/main/sstp/renew-sstp.sh" && chmod +x /usr/bin/renew-sstp
    wget -q -O /usr/bin/trial-sstp "https://raw.githubusercontent.com/bracoli/g/main/sstp/trial-sstp.sh" && chmod +x /usr/bin/trial-sstp
    wget -q -O /usr/bin/port-sstp "https://raw.githubusercontent.com/bracoli/g/main/sstp/port-sstp.sh" && chmod +x /usr/bin/port-sstp
    wget -q -O /usr/bin/sstp-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/sstp-menu.sh" && chmod +x /usr/bin/sstp-menu
echo -e "[ ${green}INFO${NC} ] Updating shadowsocks ..."
    #Update SS
    wget -q -O /usr/bin/add-ss "https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/add-ss.sh" && chmod +x /usr/bin/add-ss
    wget -q -O /usr/bin/del-ss "https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/del-ss.sh" && chmod +x /usr/bin/del-ss
    wget -q -O /usr/bin/cek-ss "https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/cek-ss.sh" && chmod +x /usr/bin/cek-ss
    wget -q -O /usr/bin/renew-ss "https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/renew-ss.sh" && chmod +x /usr/bin/renew-ss
    wget -q -O /usr/bin/trial-ss "https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/trial-ss.sh" && chmod +x /usr/bin/trial-ss
    wget -q -O /usr/bin/ss-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/ss-menu.sh" && chmod +x /usr/bin/ss-menu
echo -e "[ ${green}INFO${NC} ] Updating shadowsocks-r ..."
    #Update SSR
    wget -q -O /usr/bin/add-ssr https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/add-ssr.sh && chmod +x /usr/bin/add-ssr
    wget -q -O /usr/bin/del-ssr https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/del-ssr.sh && chmod +x /usr/bin/del-ssr
    wget -q -O /usr/bin/renew-ssr https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/renew-ssr.sh && chmod +x /usr/bin/renew-ssr
    wget -q -O /usr/bin/trial-ssr https://raw.githubusercontent.com/bracoli/g/main/shadowsocks/trial-ssr.sh && chmod +x /usr/bin/trial-ssr
echo -e "[ ${green}INFO${NC} ] Updating l2tp ..."
    #Update IPSEC
    wget -q -O /usr/bin/add-l2tp https://raw.githubusercontent.com/bracoli/g/main/ipsec/add-l2tp.sh && chmod +x /usr/bin/add-l2tp
    wget -q -O /usr/bin/del-l2tp https://raw.githubusercontent.com/bracoli/g/main/ipsec/del-l2tp.sh && chmod +x /usr/bin/del-l2tp
    wget -q -O /usr/bin/add-pptp https://raw.githubusercontent.com/bracoli/g/main/ipsec/add-pptp.sh && chmod +x /usr/bin/add-pptp
    wget -q -O /usr/bin/del-pptp https://raw.githubusercontent.com/bracoli/g/main/ipsec/del-pptp.sh && chmod +x /usr/bin/del-pptp
    wget -q -O /usr/bin/renew-pptp https://raw.githubusercontent.com/bracoli/g/main/ipsec/renew-pptp.sh && chmod +x /usr/bin/renew-pptp
    wget -q -O /usr/bin/renew-l2tp https://raw.githubusercontent.com/bracoli/g/main/ipsec/renew-l2tp.sh && chmod +x /usr/bin/renew-l2tp
    wget -q -O /usr/bin/trial-pptp https://raw.githubusercontent.com/bracoli/g/main/ipsec/trial-pptp.sh && chmod +x /usr/bin/trial-pptp
    wget -q -O /usr/bin/trial-l2tp https://raw.githubusercontent.com/bracoli/g/main/ipsec/trial-l2tp.sh && chmod +x /usr/bin/trial-l2tp
echo -e "[ ${green}INFO${NC} ] Updating menu ..."
    #Update Menu
    wget -q -O /usr/bin/menu "https://raw.githubusercontent.com/bracoli/g/main/newmenu.sh" && chmod +x /usr/bin/menu
    wget -q -O /usr/bin/setting-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/setting-menu.sh" && chmod +x /usr/bin/setting-menu
    wget -q -O /usr/bin/autokill-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/autokill-menu.sh" && chmod +x /usr/bin/autokill-menu
    wget -q -O /usr/bin/info-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/info-menu.sh" && chmod +x /usr/bin/info-menu
    wget -q -O /usr/bin/system-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/system-menu.sh" && chmod +x /usr/bin/system-menu
    wget -q -O /usr/bin/trial-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/trial-menu.sh" && chmod +x /usr/bin/trial-menu
    wget -q -O /usr/bin/ipsec-menu "https://raw.githubusercontent.com/bracoli/g/main/menu_all/ipsec-menu.sh" && chmod +x /usr/bin/ipsec-menu

echo -e "[ ${green}INFO${NC} ] Updating extension ..."
    #Update Ekstension
    wget -q -O /usr/bin/status "https://raw.githubusercontent.com/bracoli/g/main/dll/status.sh" && chmod +x /usr/bin/status
    wget -q -O /usr/bin/autoreboot "https://raw.githubusercontent.com/bracoli/g/main/dll/autoreboot.sh" && chmod +x /usr/bin/autoreboot
    wget -q -O /usr/bin/limit-speed "https://raw.githubusercontent.com/bracoli/g/main/dll/limit-speed.sh" && chmod +x /usr/bin/limit-speed
    wget -q -O /usr/bin/add-host "https://raw.githubusercontent.com/bracoli/g/main/dll/add-host.sh" && chmod +x /usr/bin/add-host
    wget -q -O /usr/bin/akill-ws "https://raw.githubusercontent.com/bracoli/g/main/dll/akill-ws.sh" && chmod +x /usr/bin/akill-ws
    wget -q -O /usr/bin/autokill-ws "https://raw.githubusercontent.com/bracoli/g/main/dll/autokill-ws.sh" && chmod +x /usr/bin/autokill-ws
    wget -q -O /usr/bin/xp https://raw.githubusercontent.com/bracoli/g/main/dll/xp.sh && chmod +x /usr/bin/xp
    wget -q -O /usr/bin/info https://raw.githubusercontent.com/bracoli/g/main/dll/info.sh && chmod +x /usr/bin/info
    
    #Update Set-BR
    wget -q -O /usr/bin/cleaner "https://raw.githubusercontent.com/bracoli/g/main/dll/logcleaner.sh" && chmod +x /usr/bin/cleaner
    wget -q -O /usr/bin/backup "https://raw.githubusercontent.com/bracoli/g/main/dll/system/backup.sh" && chmod +x /usr/bin/backup
    wget -q -O /usr/bin/bckp "https://raw.githubusercontent.com/bracoli/g/main/dll/system/bckp.sh" && chmod +x /usr/bin/bckp
    wget -q -O /usr/bin/restore "https://raw.githubusercontent.com/bracoli/g/main/dll/system/restore.sh" && chmod +x /usr/bin/restore
    wget -q -O /usr/bin/kernel-updt "https://raw.githubusercontent.com/bracoli/g/main/dll/system/kernel-updt.sh" && chmod +x /usr/bin/kernel-updt
    wget -q -O /usr/bin/ubuntu-kernel "https://raw.githubusercontent.com/bracoli/g/main/dll/system/ubuntu-kernel.sh" && chmod +x /usr/bin/ubuntu-kernel
    wget -q -O /usr/bin/ram "https://raw.githubusercontent.com/bracoli/g/main/dll/system/ram.py" && chmod +x /usr/bin/ram
    wget -q -O /usr/bin/speedtest "https://raw.githubusercontent.com/bracoli/g/main/dll/system/speedtest_cli.py" && chmod +x /usr/bin/speedtest
    wget -q -O /usr/bin/swapkvm "https://raw.githubusercontent.com/bracoli/g/main/dll/system/swapkvm.sh" && chmod +x /usr/bin/swapkvm
    wget -q -O /usr/bin/wbmn "https://raw.githubusercontent.com/bracoli/g/main/dll/system/webmin.sh" && chmod +x /usr/bin/wbmn
    wget -q -O /usr/bin/update-script "https://raw.githubusercontent.com/bracoli/g/main/dll/system/update-script.sh" && chmod +x /usr/bin/update-script
    wget -q -O /usr/bin/cloudflare-pointing "https://raw.githubusercontent.com/bracoli/g/main/dll/cloudflare-pointing.sh" && chmod +x /usr/bin/cloudflare-pointing
    wget -q -O /usr/bin/cloudflare-setting "https://raw.githubusercontent.com/bracoli/g/main/dll/cloudflare-setting.sh" && chmod +x /usr/bin/cloudflare-setting
    wget -q -O /usr/bin/kill-by-user "https://raw.githubusercontent.com/bracoli/g/main/dll/kill-by-user.sh" && chmod +x /usr/bin/kill-by-user
    wget -q -O /usr/bin/importantfile "https://raw.githubusercontent.com/bracoli/g/main/dll/toolkit.sh" && chmod +x /usr/bin/importantfile
    wget -q -O /usr/bin/restart-service "https://raw.githubusercontent.com/bracoli/g/main/dll/restart-service.sh" && chmod +x /usr/bin/restart-service
    wget -q -O /usr/bin/ohp https://scrzoke.000webhostapp.com/ohp && chmod +x /usr/bin/ohp
    wget -q -O /usr/bin/ohp-ssh "https://raw.githubusercontent.com/bracoli/g/main/dll/ohp-ssh.sh" && chmod +x /usr/bin/ohp-ssh
    wget -q -O /usr/bin/ohp-db "https://raw.githubusercontent.com/bracoli/g/main/dll/ohp-db.sh" && chmod +x /usr/bin/ohp-db
    wget -q -O /usr/bin/ohp-opn "https://raw.githubusercontent.com/bracoli/g/main/dll/ohp-opn.sh" && chmod +x /usr/bin/ohp-opn

    echo -e "[ ${green}INFO${NC} ] Updating bot panel telegram..."
    #Update Bot-Panel

    wget -q -O /etc/.maAsiss/.Shellbtsss https://scrzoke.000webhostapp.com/crud/ShellBot.sh
    wget -q -O /usr/bin/installbot "https://raw.githubusercontent.com/bracoli/g/main/bot_panel/installer.sh" && chmod +x /usr/bin/installbot
    wget -q -O /usr/bin/bbt "https://raw.githubusercontent.com/bracoli/g/main/bot_panel/bbt.sh" && chmod +x /usr/bin/bbt

#BrBaru
wget -q -O /usr/bin/addxtls "https://raw.githubusercontent.com/bracoli/g/main/xray/add.sh" && chmod +x /usr/bin/addxtls
wget -q -O /usr/bin/delxtls "https://raw.githubusercontent.com/bracoli/g/main/xray/del.sh" && chmod +x /usr/bin/delxtls
wget -q -O /usr/bin/cekxtls "https://raw.githubusercontent.com/bracoli/g/main/xray/chk.sh" && chmod +x /usr/bin/cekxtls
wget -q -O /usr/bin/renewxtls "https://raw.githubusercontent.com/bracoli/g/main/xray/rnw.sh" && chmod +x /usr/bin/renewxtls
wget -q -O /usr/bin/portxtls "https://raw.githubusercontent.com/bracoli/g/main/xray/pxt.sh" && chmod +x /usr/bin/portxtls

}
echo -e "[ ${green}INFO${NC} ] Updating script ..."
sleep 2
Updater_ALL
##############++++++++++++++++++++++++#############


# bxxx=$(cat /root/log-install.txt | grep -w "   - VLess TCP XTLS          : 2087" | wc -l)
# if [ "$bxxx" = "2" ]; then
# sed -i "14d" /root/log-install.txt
# fi

##############++++++++++++++++++++++++#############
LLatest=`date`
Get_Data () {
git clone https://github.com/pompom/LOG-USER.git /etc/user-update/ &> /dev/null
}

Mkdir_Data () {
mkdir -p /etc/user-update/$NameUser
}

Input_Data_Append () {
if [ ! -f "/etc/user-update/$NameUser/$NameUser-Update-LOG" ]; then
touch /etc/user-update/$NameUser/$NameUser-Update-LOG
fi
echo -e "IP           : $MYIP
User         : $NameUser
Status       : Success to ver $serverV
Last-updates : $LLatest
" >> /etc/user-update/$NameUser/$NameUser-Update-LOG
}

Save_And_Exit () {
    cd /etc/user-update
    git config --global user.email "cektabakek@gmail.com" &> /dev/null
    git config --global user.name "pompom" &> /dev/null
    rm -rf .git &> /dev/null
    git init &> /dev/null
    git add . &> /dev/null
    git commit -m m &> /dev/null
    git branch -M main &> /dev/null
    git remote add origin https://github.com/pompom/LOG-USER
    git push -f https://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@github.com/pompom/LOG-USER.git &> /dev/null
}

if [ ! -d "/etc/user-update/" ]; then
sleep 1
echo -e "[ ${green}INFO${NC} ] Getting database... "
Get_Data
Mkdir_Data
sleep 1
echo -e "[ ${green}INFO${NC} ] Getting info server... "
Input_Data_Append
sleep 1
echo -e "[ ${green}INFO${NC} ] Processing updating server...... "
Save_And_Exit
fi

##############++++++++++++++++++++++++#############
if [ ! -f "/etc/log-create-user.log" ]; then
echo "Log All Account " > /etc/log-create-user.log
fi

if [ ! -f "/etc/cron.d/cleaner" ]; then
cat> /etc/cron.d/cleaner << END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
* */6 * * * root /usr/bin/cleaner
END
fi

sed -i "/Autoreboot/c\   - Autoreboot On           : 5:00 AM [GMT+7]" /root/log-install.txt

cat > /etc/cron.d/re_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
0 5 * * * root /sbin/reboot
END

cat > /home/re_otm <<-END
5
END

cat > /etc/cron.d/xp_otm <<-END
SHELL=/bin/sh
PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
2 0 * * * root /usr/bin/xp
END

cat> /root/.profile << END
# ~/.profile: executed by Bourne-compatible login shells.

if [ "$BASH" ]; then
  if [ -f ~/.bashrc ]; then
    . ~/.bashrc
  fi
fi

mesg n || true
clear
importantfile
menu
END
chmod 644 /root/.profile

systemctl restart cron > /dev/null 2>&1
systemctl restart nginx > /dev/null 2>&1
systemctl restart ohp-ssh > /dev/null 2>&1
systemctl restart ohp-db > /dev/null 2>&1
systemctl restart ohp-opn > /dev/null 2>&1
echo $serverV > /opt/.ver
sleep 1
echo -e "[ ${green}INFO${NC} ] Update done...... "
sleep 1
echo -e "[ ${green}INFO${NC} ] Back to home after 3 seconds...... "
sleep 3
rm /usr/bin/yow > /dev/null 2>&1
rm /usr/bin/update-script > /dev/null 2>&1
rm /usr/bin/port-vless >/dev/null 2>&1
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
screen -XS upds quit
screen -XS updss quit
bash /root/.profile
