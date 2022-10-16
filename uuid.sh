#!/bin/bash

uuid = $(cat / proc / sys / kernel / random / uuid)# xray config

wget -O /etc/xray/vmess-ws.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/vmess-ws.json && chmod +x /etc/xray/vmess-ws.json
sed -i $uuid /etc/xray/vmess-ws.json 

wget -O /etc/xray/vmess-grpc.json https://raw.githubusercontent.com/hidessh99/tuunnel-mx/main/hide-xray/vmess-grpc.json && chmod +x /etc/xray/vmess-grpc.json
sed -i $uuid /etc/xray/vmess-grpc.json
