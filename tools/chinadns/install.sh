#!/bin/sh
echo "Start to install Chinadns..."
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
mkdir -p /usr/local/chinadns/bin
cp -f ${BASEDIR}/bin/chinadns /usr/local/chinadns/bin
chmod +x /usr/local/chinadns/bin/chinadns
ln -s /usr/local/chinadns/bin/chinadns /usr/bin/chinadns

mkdir -p /etc/chinadns/
cp -f ${BASEDIR}/conf/chnroute.txt /etc/chinadns/

cp -f ${BASEDIR}/service/chinadns /etc/init.d/
chmod +x /etc/init.d/chinadns
update-rc.d chinadns defaults
echo "End to install Chinadns."
