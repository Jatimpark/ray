#!/bin/bash
NC='\e[0m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\033[0;37m'
YB='\e[33;1m'
BB='\033[0;34m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\033[0;34m'
clear
echo ""
echo ""
echo -e "${BB}—————————————————————————————————————————————————————————${NC}"
echo -e "               \E[42;1;37mIMOD SCRIPT BY ARYA BLITAR${NC}"
echo -e "${BB}—————————————————————————————————————————————————————————${NC}"
echo -e "  ${GB}»»» Protocol Service «««  |  »»» Network Protocol «««${NC}  "
echo -e "${BB}—————————————————————————————————————————————————————————${NC}"
echo -e "  ${GB}- Vless${NC}                   ${WB}|${NC}  ${GB}- Websocket (CDN) non TLS${NC}"
echo -e "  ${GB}- Vmess${NC}                   ${WB}|${NC}  ${GB}- Websocket (CDN) TLS${NC}"
echo -e "  ${GB}- Trojan${NC}                  ${WB}|${NC}  ${GB}- gRPC (CDN) TLS${NC}"
echo -e "  ${GB}- Socks5${NC}                  ${WB}|${NC}"
echo -e "  ${GB}- Shadowsocks${NC}             ${WB}|${NC}"
echo -e "  ${GB}- Shadowsocks 2022${NC}        ${WB}|${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "               \E[42;1;37mI»»» Network Port Service «««${NC}             "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "  ${GB}- HTTPS : 443, 2053, 2083, 2087, 2096, 8443${NC}"
echo -e "  ${GB}- HTTP  : 80, 8080, 8880, 2052, 2082, 2086, 2095${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
