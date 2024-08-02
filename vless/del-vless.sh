#!/bin/bash
DEFBOLD='\e[39;1m'
RB='\033[0;36m'
GB='\033[0;32m'
YB='\e[33;1m'
BB='\033[0;34m'
MB='\033[0;33m'
CB='\e[35;1m'
WB='\e[37;1m'
clear
NUMBER_OF_CLIENTS=$(grep -c -E "^#= " "/usr/local/etc/xray/config.json")
if [[ ${NUMBER_OF_CLIENTS} == '0' ]]; then
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                 ${RB}Delete Vless Account${NC}               "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "  ${RB}You have no existing clients!${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -n 1 -s -r -p "Press any key to back on menu"
vless
fi
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "                 Delete Vless Account               "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e " ${RB}User  Expired${NC}  "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
grep -E "^#= " "/usr/local/etc/xray/config.json" | cut -d ' ' -f 2-3 | column -t | sort | uniq
echo ""
echo -e "${YB}tap enter to go back${NC}"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
read -rp "Input Username : " user
if [ -z $user ]; then
vless
else
exp=$(grep -wE "^#= $user" "/usr/local/etc/xray/config.json" | cut -d ' ' -f 3 | sort | uniq)
sed -i "/^#= $user $exp/,/^},{/d" /usr/local/etc/xray/config.json
rm -rf /var/www/html/vless/vless-$user.txt
rm -rf /user/log-vless-$user.txt
systemctl restart xray
clear
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e "            ${RB}Vless Account Success Deleted${NC}           "
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo -e " ${RB}Client Name :${NC} $user"
echo -e " ${RB}Expired On  :${NC} $exp"
echo -e "${BB}————————————————————————————————————————————————————${NC}"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
clear
vless
fi
