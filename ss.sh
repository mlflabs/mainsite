

apt update
apt install docker.io  
###########################
docker pull teddysun/shadowsocks-rust
mkdir -p /etc/shadowsocks-rust


cat > /etc/shadowsocks-rust/config.json <<EOF
{
    "server":"0.0.0.0",
    "server_port":443,
    "password":"password",
    "timeout":300,
    "method":"aes-256-gcm",
    "nameserver":"8.8.8.8",
    "mode":"tcp_and_udp"
}
EOF
docker run -d -p 443:443 -p 443:443/udp --name ss-rust --restart=always -v /etc/shadowsocks-rust:/etc/shadowsocks-rust teddysun/shadowsocks-rust
