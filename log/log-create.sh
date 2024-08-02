#!/bin/bash
NC='\033[0;37m'
DEFBOLD='\e[39;0m'
RB='\033[0;36m'
GB='\033[0;37m'
YB='\033[0;37m'
BB='\033[0;34m'
MB='\033[0;33m'
CB='\e[35;1m'
WB='\e[37;0m'
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                \E[42;1;37m Log Create User${NC}                   "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e ""
echo -e " ${MB}[1]${NC} ${YB}Log Vmess Account${NC} "
echo -e " ${MB}[2]${NC} ${YB}Log Vless Account${NC} "
echo -e " ${MB}[3]${NC} ${YB}Log Trojan Account${NC} "
echo -e " ${MB}[4]${NC} ${YB}Log Shadowsocks Account${NC}"
echo -e " ${MB}[5]${NC} ${YB}Log Shadowsocks 2022 Account${NC}"
echo -e " ${MB}[6]${NC} ${YB}Log Socks5 Account${NC}"
echo -e " ${MB}[7]${NC} ${YB}Log All Xray Account${NC}"
echo -e ""
echo -e " ${MB}[0]${NC} ${YB}Back To Menu${NC}"
echo -e ""
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e ""
read -p " Select menu :  "  opt
echo -e ""
case $opt in
1) clear ; log-vmess ; exit ;;
2) clear ; log-vless ; exit ;;
3) clear ; log-trojan ; exit ;;
4) clear ; log-ss ; exit ;;
5) clear ; log-ss2022 ; exit ;;
6) clear ; log-socks ; exit ;;
7) clear ; log-allxray ; exit ;;
0) clear ; menu ; exit ;;
x) exit ;;
*) echo "salah tekan " ; sleep 0.5 ; log-create ;;
esac
