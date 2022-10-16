#!/bin/bash

uuid = $(cat/proc / sys / kernel / random / uuid)# xray config
uuid2="s/xxxxx/$uuid/g";

sed -i $uuid2 /etc/xray/vmess-ws.json 
sed -i $uuid2 /etc/xray/vmess-grpc.json
