#!/bin/sh
echo "Start to install Chinadns..."
mkdir -p /usr/local/chinadns/bin
cp -f ./bin/chinadns /usr/local/chinadns/bin
chmod +x /usr/local/chinadns/bin/chinadns
ln -s /usr/local/chinadns/bin/chinadns /usr/bin/chinadns

mkdir -p /etc/chinadns/
cp -f ./conf/chnroute.txt /etc/chinadns/

cp -f ./service/chinadns /etc/init.d/
chmod +x /etc/init.d/chinadns
update-rc.d chinadns defaults
echo "End to install Chinadns."
