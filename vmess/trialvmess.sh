#!/bin/bash
NC='\033[0;37m'
DEFBOLD='\e[39;0m'
RB='\033[0;36m'
GB='\033[0;37m'
YB='\e[33;1m'
BB='\033[0;34m'
MB='\033[0;33m'
CB='\e[35;1m'
WB='\e[37;0m'

clear
domain=$(cat /usr/local/etc/xray/domain)
user=trial-`echo $RANDOM | head -c4`
uuid=$(cat /proc/sys/kernel/random/uuid)
masaaktif=1
echo ""
echo ""
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vmess$/a\#@ '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#vmess-grpc$/a\#@ '"$user $exp"'\
},{"id": "'""$uuid""'","alterId": '"0"',"email": "'""$user""'"' /usr/local/etc/xray/config.json
vlink1=`cat<<EOF
{
"v": "2",
"ps": "$user",
"add": "$domain",
"port": "443",
"id": "$uuid",
"aid": "0",
"net": "ws",
"path": "/vmess",
"type": "none",
"host": "$domain",
"tls": "tls"
}
EOF`
vlink2=`cat<<EOF
{
"v": "2",
"ps": "$user",
"add": "$domain",
"port": "80",
"id": "$uuid",
"aid": "0",
"net": "ws",
"path": "/vmess",
"type": "none",
"host": "$domain",
"tls": "none"
}
EOF`
vlink3=`cat << EOF
{
"v": "2",
"ps": "$user",
"add": "$domain",
"port": "443",
"id": "$uuid",
"aid": "0",
"net": "grpc",
"path": "vmess-grpc",
"type": "none",
"host": "$domain",
"tls": "tls"
}
EOF`
vmesslink1="vmess://$(echo $vlink1 | base64 -w 0)"
vmesslink2="vmess://$(echo $vlink2 | base64 -w 0)"
vmesslink3="vmess://$(echo $vlink3 | base64 -w 0)"
cat > /var/www/html/vmess/vmess-$user.txt << END
====================
BY ARYA NBC
wa.me/6287721815317
====================

# Format Vmess WS TLS

proxies:
  - name: Vmess-$user-WS TLS
    server: bug.com
    port: 443
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vmess
      headers:
        Host: ${domain}
    udp: true

# Format Vmess WS Non TLS

proxies:
  - name: Vmess-$user-WS Non TLS
    server: bug.com
    port: 80
    type: vmess
    uuid: ${domain}
    alterId: 0
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vmess
      headers:
        Host: ${domain}
    udp: true

# Format Vmess gRPC

proxies:
  - name: Vmess-$user-gRPC (SNI)
    server: ${domain}
    port: 443
    type: vmess
    uuid: ${uuid}
    alterId: 0
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: bug.com
    network: grpc
    grpc-opts:
      grpc-service-name: vmess-grpc
    udp: true
    
==========================
Link Vmess Account
==========================
Link TLS : vmess://$(echo $vlink1 | base64 -w 0)
==========================
Link non TLS : vmess://$(echo $vlink2 | base64 -w 0)
==========================
END
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
systemctl restart xray
clear
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo -e "                Trial Vmess Account                 " | tee -a /user/log-vmess-$user.txt
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo -e "Remarks       : $user" | tee -a /user/log-vmess-$user.txt
echo -e "ISP           : $ISP" | tee -a /user/log-vmess-$user.txt
echo -e "City          : $CITY" | tee -a /user/log-vmess-$user.txt
echo -e "Domain        : $domain" | tee -a /user/log-vmess-$user.txt
echo -e "Wildcard      : (bug.com).$domain" | tee -a /user/log-vmess-$user.txt
echo -e "Port TLS      : 443" | tee -a /user/log-vmess-$user.txt
echo -e "Port NTLS     : 80" | tee -a /user/log-vmess-$user.txt
echo -e "Port gRPC     : 443" | tee -a /user/log-vmess-$user.txt
echo -e "Alt Port TLS  : 2053, 2083, 2087, 2096, 8443" | tee -a /user/log-vmess-$user.txt
echo -e "Alt Port NTLS : 8080, 8880, 2052, 2082, 2086, 2095" | tee -a /user/log-vmess-$user.txt
echo -e "id            : $uuid" | tee -a /user/log-vmess-$user.txt
echo -e "AlterId       : 0" | tee -a /user/log-vmess-$user.txt
echo -e "Security      : auto" | tee -a /user/log-vmess-$user.txt
echo -e "Network       : Websocket" | tee -a /user/log-vmess-$user.txt
echo -e "Path          : /(multipath) • ubah suka-suka" | tee -a /user/log-vmess-$user.txt
echo -e "ServiceName   : vmess-grpc" | tee -a /user/log-vmess-$user.txt
echo -e "Alpn          : h2, http/1.1" | tee -a /user/log-vmess-$user.txt
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo -e "Link TLS      : $vmesslink1" | tee -a /user/log-vmess-$user.txt
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo -e "Link NTLS     : $vmesslink2" | tee -a /user/log-vmess-$user.txt
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo -e "Link gRPC     : $vmesslink3" | tee -a /user/log-vmess-$user.txt
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo -e "Format Clash  : http://$domain:8000/vmess/vmess-$user.txt" | tee -a /user/log-vmess-$user.txt
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo -e "Expired On    : $exp" | tee -a /user/log-vmess-$user.txt
echo -e "————————————————————————————————————————————————————" | tee -a /user/log-vmess-$user.txt
echo " " | tee -a /user/log-vmess-$user.txt
echo " " | tee -a /user/log-vmess-$user.txt
echo " " | tee -a /user/log-vmess-$user.txt
read -n 1 -s -r -p "Press any key to back on menu"
clear
vmess
