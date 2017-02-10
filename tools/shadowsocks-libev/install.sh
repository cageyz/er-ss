#!/bin/sh
echo "Start to install shadowsocks..."
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p /usr/local/shadowsocks-libev/bin
cp -f -r ${BASEDIR}/bin/ /usr/local/shadowsocks-libev
ln -s /usr/local/shadowsocks-libev/bin/ss-redir /usr/bin/ss-redir
ln -s /usr/local/shadowsocks-libev/bin/ss-tunnel /usr/bin/ss-tunnel
chmod +x /usr/local/shadowsocks-libev/bin/ss-redir
chmod +x /usr/local/shadowsocks-libev/bin/ss-tunnel

mkdir -p /etc/shadowsocks-libev/
cp -f ${BASEDIR}/conf/config.json /etc/shadowsocks-libev/

cp -f -r ${BASEDIR}/service/shadowsocks /etc/init.d/
cp -f -r ${BASEDIR}/service/ss-tunnel /etc/init.d/
chmod +x /etc/init.d/shadowsocks
chmod +x /etc/init.d/ss-tunnel

update-rc.d shadowsocks defaults
update-rc.d ss-tunnel defaults

echo "End to install shadowsocks."
