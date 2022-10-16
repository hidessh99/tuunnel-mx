#!/bin/bash

uuid = $(cat/proc / sys / kernel / random / uuid)# xray config
uuid2="s/xxxxx/$uuid/g";

sed -i $uuid2 /etc/xray/vmess-ws.json 

wget -O /etc/xray/vmess-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/vmess-grpc.json && chmod +x /etc/xray/vmess-grpc.json
sed -i $uuid2 /etc/xray/vmess-grpc.json
