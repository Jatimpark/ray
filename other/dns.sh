#!/bin/bash
NC='\033[0;37m'
DEFBOLD='\e[39;1m'
RB='\e[31;1m'
GB='\033[0;32m'
YB='\e[33;1m'
BB='\033[0;34m'
MB='\e[35;1m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -rp "Domain/Host: " -e host
if [ -z $host ]; then
echo -e "${GB}????${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
dns
else
echo "DNS=$host" > /var/lib/dnsvps.conf
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "${GB}Dont Forget To Renew Cert${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
fi
