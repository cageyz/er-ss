#!/bin/sh
echo "Start to install shadowsocks..."
mkdir -p /usr/local/shadowsocks-libev/bin
cp -f -r ./bin/ /usr/local/shadowsocks-libev
ln -s /usr/local/shadowsocks-libev/bin/ss-redir /usr/bin/ss-redir
ln -s /usr/local/shadowsocks-libev/bin/ss-tunnel /usr/bin/ss-tunnel
chmod +x /usr/local/shadowsocks-libev/bin/ss-redir
chmod +x /usr/local/shadowsocks-libev/bin/ss-tunnel

mkdir -p /etc/shadowsocks-libev/
cp -f ./conf/config.json /etc/shadowsocks-libev/

cp -f -r ./service/shadowsocks /etc/init.d/
cp -f -r ./service/ss-tunnel /etc/init.d/
chmod +x /etc/init.d/shadowsocks
chmod +x /etc/init.d/ss-tunnel

update-rc.d shadowsocks defaults
update-rc.d ss-tunnel defaults

echo "End to install shadowsocks."
