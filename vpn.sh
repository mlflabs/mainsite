#!/bin/bash

#setup vars
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

options=(
    "Install Shadowsocks",
    "Install v2ray"
)


ciphers=(
	aes-128-gcm
	aes-256-gcm
	chacha20-ietf-poly1305
)



#First Menu
echo "Options:"

for ((i = 1; i <= ${#options[*]}; i++)); do
    echo "($i) ${options[$i - 1]}"
done

read -p "Choose Option: " mainOption


ssPort=443
ssPassword="password123"
ssMethod="chacha20-ietf-poly1305"


##############
f_readSSOptions() {
	#read -p "Continue? (Y/N): " confirm && [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]] || exit 1
	read -p "Port [$ssPort]:" ssPort
	ssPort=${ssPort:-$ssPort}
}


##############
f_writeSSSettings() {
docker pull teddysun/shadowsocks-rust
mkdir -p /etc/shadowsocks-rust
cat << EOF > /etc/shadowsocks-rust/config.json
{
	   "server":"0.0.0.0",
	   "server_port": $ssPort,
	   "password": $ssPassword,
	   "timeout":300,
	   "method": $ssMethod,
	   "nameserver":"8.8.8.8",
	   "mode":"tcp_and_udp"
}
EOF
}


################
if [$mainOption -eq 1]
then
	f_readSSOptions
fi


