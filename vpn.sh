#!/bin/bash

#setup vars
red='\e[91m'
green='\e[92m'
yellow='\e[93m'
magenta='\e[95m'
cyan='\e[96m'
none='\e[0m'

options=(
	"Install Shadowsocks"
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
    echo "($i) ${transport[$i - 1]}"


done
