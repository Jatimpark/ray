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
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#÷ " "/usr/local/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "               ${RB}Delete Socks5 Account${NC}                "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "  ${GB}You have no existing clients!${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
socks
fi
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "               ${RB}Delete Socks5 Account${NC}                "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e " ${GB}User  Expired${NC}  "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
grep -E "^#÷ " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "${GB}tap enter to go back${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -rp "Input Username : " user
if [ -z $user ]; then
trojan
else
exp=$(grep -wE "^#÷ $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^#÷ $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/socks5/socks5-$user.txt
rm -rf /user/log-socks5-$user.txt
systemctl restart xray
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "           ${RB}Socks5 Account Success Deleted${NC}           "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e " ${GB}Client Name :${NC} $user"
echo -e " ${GB}Expired On  :${NC} $exp"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
clear
socks
fi
