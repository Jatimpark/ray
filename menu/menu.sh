#!/bin/bash
DEFBOLD='\e[39;1m'
RB='\033[0;36m'
GB='\033[0;32m'
YB='\e[33;1m'
BB='\033[0;34m'
MB='\033[0;33m'
CB='\e[35;1m'
WB='\e[37;1m'
GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0;37m'
RED='\033[0;31m'
green='\033[0;32m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
NC='\033[0;37m'
KN='\033[0;33m'
ORANGE='\033[0;33m'
PINK='\033[0;35m'

clear
xray_service=$(systemctl status xray | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
nginx_service=$(systemctl status nginx | grep Active | awk '{print $3}' | cut -d "(" -f2 | cut -d ")" -f1)
if [[ $xray_service == "running" ]]; then
status_xray="${GREEN}[ ON ]${NC}"
else
status_xray="${RED}[ OFF ]${NC}"
fi
if [[ $nginx_service == "running" ]]; then
status_nginx="${GREEN}[ ON ]${NC}"
else
status_nginx="${RED}[ OFF ]${NC}"
fi
dtoday="$(vnstat | grep today | awk '{print $2" "substr ($3, 1, 3)}')"
utoday="$(vnstat | grep today | awk '{print $5" "substr ($6, 1, 3)}')"
ttoday="$(vnstat | grep today | awk '{print $8" "substr ($9, 1, 3)}')"
dmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $2" "substr ($3, 1 ,3)}')"
umon="$(vnstat -m | grep `date +%G-%m` | awk '{print $5" "substr ($6, 1 ,3)}')"
tmon="$(vnstat -m | grep `date +%G-%m` | awk '{print $8" "substr ($9, 1 ,3)}')"
domain=$(cat /usr/local/etc/xray/domain)
ISP=$(cat /usr/local/etc/xray/org)
CITY=$(cat /usr/local/etc/xray/city)
WKT=$(cat /usr/local/etc/xray/timezone)
DATE=$(date -R | cut -d " " -f -4)
MYIP=$(curl -sS ipv4.icanhazip.com)
clear
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "               \E[42;1;37m      [ Xray Script ]      ${NC}              "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${GB}Public IP${NC}        ${GB}: $MYIP"
echo -e " ${GB}Service Provider${NC} ${GB}: $ISP"
echo -e " ${GB}Timezone${NC}         ${GB}: $WKT${NC}"
echo -e " ${GB}City${NC}             ${GB}: $CITY${NC}"
echo -e " ${GB}Date${NC}             ${GB}: $DATE${NC}"
echo -e " ${GB}Domain${NC}           ${GB}: $domain${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "     ${NC}NGINX STATUS :${GREEN} $status_nginx    ${NC}XRAY STATUS :${GREEN} $status_xray   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "          ${RB}      [ Bandwidth Monitoring ]      ${NC}"
echo -e ""
echo -e "  ${NC}Today ($DATE)     Monthly ($(date +%B/%Y))${NC}      "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "    ${RB}↓↓ Down: $dtoday          ↓↓ Down: $dmon${NC}   "
echo -e "    ${RB}↑↑ Up  : $utoday          ↑↑ Up  : $umon${NC}   "
echo -e "    ${RB}≈ Total: $ttoday          ≈ Total: $tmon${NC}   "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                \E[42;1;37m      [ Xray Menu ]      ${NC}               "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[1]${NC} ${GB}Vmess Menu${NC}          ${MB}[5]${NC} ${GB}Shadowsocks 2022 Menu${NC}"
echo -e " ${MB}[2]${NC} ${GB}Vless Menu${NC}          ${MB}[6]${NC} ${GB}Socks5 Menu${NC}"
echo -e " ${MB}[3]${NC} ${GB}Trojan Menu${NC}         ${MB}[7]${NC} ${GB}All Xray Menu${NC}"
echo -e " ${MB}[4]${NC} ${GB}Shadowsocks Menu${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e "                \E[42;1;37m      [ KEGUNAAN ]      ${NC}                "
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e " ${MB}[8]${NC} ${GB}Log Create Account${NC}  ${MB}[13]${NC} ${GB}DNS Setting${NC}"
echo -e " ${MB}[9]${NC} ${GB}Speedtest${NC}           ${MB}[14]${NC} ${GB}Check DNS Status${NC}"
echo -e " ${MB}[10]${NC} ${GB}Change Domain${NC}      ${MB}[15]${NC} ${GB}Change Xray-core Mod${NC}"
echo -e " ${MB}[11]${NC} ${GB}Renew Cert${NC}         ${MB}[16]${NC} ${GB}Change Xray-core Official${NC}"
echo -e " ${MB}[12]${NC} ${GB}About Script${NC}       ${MB}[x]${NC}  ${GB}Exit Menu${NC}"
echo -e "${BB}————————————————————————————————————————————————————————${NC}"
echo -e ""
echo -e "${BB} ┌─────────────────────────────────────────────────────┐${NC}"
echo -e "${GREEN}  ${RED}▁ ${CYAN}▂ ${GREEN}▄ ${ORANGE}▅${PINK} ▆${GREEN} ▇ ${RED}█${BLUE}𒆜${CYAN} ༻${NC}  SCRIPT ARYA BLITAR ${BLUE}༺ ${RED}𒆜${GREEN}█ ${ORANGE}▇ ${CYAN}▆ ${RED}▅ ${GREEN}▄ ${ORANGE}▂ ${PINK}▁\E[0m"
echo -e "${BB} └─────────────────────────────────────────────────────┘${NC}"
echo -e ""

echo -e " ${BB}┌─────────────────────────────────────────────────────┐${NC}"
echo -e "  VERSION GRATIS 2024 "
echo -e " ${BB}└─────────────────────────────────────────────────────┘${NC}"
echo
read -p " Select Menu :  "  opt
echo -e ""
case $opt in
1) clear ; vmess ;;
2) clear ; vless ;;
3) clear ; trojan ;;
4) clear ; shadowsocks ;;
5) clear ; shadowsocks2022 ;;
6) clear ; socks ;;
7) clear ; allxray ;;
8) clear ; log-create ;;
9) clear ; speedtest ;;
10) clear ; dns ;;
11) clear ; certxray ;;
12) clear ; about ;;
13) clear ; changer ;;
14) clear ;
resolvectl status
echo ""
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
echo ""
echo ""
menu ;;
15) clear ; xraymod ;;
16) clear ; xrayofficial ;;
x) clear ; exit ;;
*) echo -e "${RB}salah input${NC}" ; sleep 1 ; menu ;;
esac
