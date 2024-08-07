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
until [[ $user =~ ^[a-zA-Z0-9_]+$ && ${CLIENT_EXISTS} == '0' ]]; do
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                  ${GB}Add Vless Account${NC}                 "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -rp "User: " -e user
CLIENT_EXISTS=$(grep -w $user /usr/local/etc/xray/config.json | wc -l)
if [[ ${CLIENT_EXISTS} == '1' ]]; then
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                  Add Vless Account                 "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "${GB}A client with the specified name was already created, please choose another name.${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
add-vless
fi
done
uuid=$(cat /proc/sys/kernel/random/uuid)
read -p "Expired (days): " masaaktif
exp=`date -d "$masaaktif days" +"%Y-%m-%d"`
sed -i '/#vless$/a\#= '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
sed -i '/#vless-grpc$/a\#= '"$user $exp"'\
},{"id": "'""$uuid""'","email": "'""$user""'"' /usr/local/etc/xray/config.json
vlesslink1="vless://$uuid@$domain:443?path=/vless&security=tls&encryption=none&host=$domain&type=ws&sni=$domain#$user"
vlesslink2="vless://$uuid@$domain:80?path=/vless&security=none&encryption=none&host=$domain&type=ws#$user"
vlesslink3="vless://$uuid@$domain:443?security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=$domain#$user"
cat > /var/www/html/vless/vless-$user.txt << END
====================
BY ARYA NBC
wa.me/6287721815317
====================

# Format Vless WS TLS

proxies:
  - name: Vless-$user-WS TLS
    server: bug.com
    port: 443
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true

# Format Vless WS Non TLS

proxies:
  - name: Vless-$user (CDN) Non TLS
    server: bug.com
    port: 80
    type: vless
    uuid: ${uuid}
    cipher: auto
    tls: false
    skip-cert-verify: true
    servername: ${domain}
    network: ws
    ws-opts:
      path: /vless
      headers:
        Host: ${domain}
    udp: true
    
# Format Vless Grpc

proxies:
  - name: Vless-$user (CDN) gRPC (SNI)
    server: ${domain}
    port: 443
    type: vless
    uuid: bdfb0d8c-b7a6-4549-bd8f-cecd9a92bbdc
    cipher: auto
    tls: true
    skip-cert-verify: true
    servername: bug.com
    network: grpc
    grpc-opts:
      grpc-service-name: vless-grpc
    udp: true

==========================
Link Vless Account
==========================
Link TL   : vless://$uuid@$domain:443?path=/vless&security=tls&encryption=none&host=$domain&type=ws&sni=$domain#$user
==========================
Link NTLS : vless://$uuid@$domain:80?path=/vless&security=none&encryption=none&host=$domain&type=ws#$user
==========================
Link gRPC : vless://$uuid@$domain:443?security=tls&encryption=none&type=grpc&serviceName=vless-grpc&sni=$domain#$user
==========================
END
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
systemctl restart xray
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo -e "                    Vless Account                   " | tee -a /user/log-vless-$user.txt
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo -e "Remarks       : ${user}" | tee -a /user/log-vless-$user.txt
echo -e "Domain        : ${domain}" | tee -a /user/log-vless-$user.txt
echo -e "ISP           : $ISP" | tee -a /user/log-vless-$user.txt
echo -e "City          : $CITY" | tee -a /user/log-vless-$user.txt
echo -e "Wildcard      : (bug.com).${domain}" | tee -a /user/log-vless-$user.txt
echo -e "Port TLS      : 443" | tee -a /user/log-vless-$user.txt
echo -e "Port NTLS     : 80" | tee -a /user/log-vless-$user.txt
echo -e "Port gRPC     : 443" | tee -a /user/log-vless-$user.txt
echo -e "Alt Port TLS  : 2053, 2083, 2087, 2096, 8443" | tee -a /user/log-vless-$user.txt
echo -e "Alt Port NTLS : 8080, 8880, 2052, 2082, 2086, 2095" | tee -a /user/log-vless-$user.txt
echo -e "id            : ${uuid}" | tee -a /user/log-vless-$user.txt
echo -e "Encryption    : none" | tee -a /user/log-vless-$user.txt
echo -e "Network       : Websocket, gRPC" | tee -a /user/log-vless-$user.txt
echo -e "Path          : /vless" | tee -a /user/log-vless-$user.txt
echo -e "ServiceName   : vless-grpc" | tee -a /user/log-vless-$user.txt
echo -e "Alpn          : h2, http/1.1" | tee -a /user/log-vless-$user.txt
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo -e "Link TLS      : ${vlesslink1}" | tee -a /user/log-vless-$user.txt
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo -e "Link NTLS     : ${vlesslink2}" | tee -a /user/log-vless-$user.txt
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo -e "Link gRPC     : ${vlesslink3}" | tee -a /user/log-vless-$user.txt
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo -e "Format Clash  : http://$domain:8000/vless/vless-$user.txt" | tee -a /user/log-vless-$user.txt
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo -e "Expired On    : $exp" | tee -a /user/log-vless-$user.txt
echo -e "${BB}————————————————————————————————————————————————————${NC}" | tee -a /user/log-vless-$user.txt
echo " " | tee -a /user/log-vless-$user.txt
echo " " | tee -a /user/log-vless-$user.txt
echo " " | tee -a /user/log-vless-$user.txt
read -n 1 -s -r -p "Press any key to back on menu"
clear
vless
