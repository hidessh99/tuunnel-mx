#!/bin/bash
uuid=$(cat /proc/sys/kernel/random/uuid);
uuid2="s/xxxxxxxxx/$uuid/g";
sed -i $uuid2 /etc/xray/vmess-ws.json
sed -i $uuid2 /etc/xray/vmess-grpc.json
