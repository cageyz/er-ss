#!/bin/sh
PATH=/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin:~/bin
export PATH
run_cfg=/opt/vyatta/sbin/vyatta-cfg-cmd-wrapper
run_op=/opt/vyatta/bin/vyatta-op-cmd-wrapper
#===================================================================
#   System Required:  EdgeMax V1.9
#   Description: Install Shadowsocks-libev For EdgeMax1.9
#   Author: Allen Zheng <https://github.com/allenn>
#   Thanks: @madeye <https://github.com/madeye> for mainten Shadowsocks
#           landvd <5586822@qq.com> for create first install scripts
#
#===================================================================

echo "Start to set up shadowsocks for EdgeRouter."

until
		echo "Please Select You Connect Mode"
		echo "1.PPPOE"
		echo "2.DHCP"
		echo "3.Static Ip"
		echo "4.Exit Setup"
		read select
		test $select = 4
		do
			case $select in
			1)echo "You Select PPPOE"
			break;;
			2)echo "You Select DHCP"
			break;;
			3)echo "You Select Static ip"
			break;;
			4)echo "Exit Setup"
			exit;;
			esac
			done
until
		echo "Please Select ShadowSocks Version"
		echo "1.ShadowSocks"
		echo "2.ShadowSocksR (Not Support)"
		read ssver
		test $ssver = 2
		do
			case $ssver in
			1)echo "You Select ShadowSocks"
			break;;
			2)echo "You Select ShadowSocksR"
			break;;
			esac
			done

echo "start to configure router dns setting"

if [ $select -eq 1 ];then
$run_cfg begin
$run_cfg set interfaces ethernet eth0 pppoe 0 name-server none
$run_cfg set service dns forwarding name-server 127.0.0.1
$run_cfg set system name-server 127.0.0.1
$run_cfg set system offload hwnat enable
$run_cfg set system offload ipsec enable
$run_cfg commit
$run_cfg save
$run_cfg end
fi
if [ $select -eq 2 ];then
$run_cfg begin
$run_cfg set service dns forwarding name-server 127.0.0.1
$run_cfg set system name-server 127.0.0.1
$run_cfg set system offload hwnat enable
$run_cfg set system offload ipsec enable
$run_cfg commit
$run_cfg save
$run_cfg end
fi
if [ $select -eq 3 ];then
$run_cfg begin
$run_cfg set service dns forwarding name-server 127.0.0.1
$run_cfg set system name-server 127.0.0.1
$run_cfg set system offload hwnat enable
$run_cfg set system offload ipsec enable
$run_cfg commit
$run_cfg save
$run_cfg end
fi
echo "end to configure router dns setting"

BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Please input service for shadowsocks-libev"
read -p "(Default service: 127.0.0.1):" shadowsocksservice
[ -z "${shadowsocksservice}" ] && shadowsocksservice="127.0.0.1"
sed -i "s/shadowsocksservice/${shadowsocksservice}/" ${BASEDIR}/tools/shadowsocks-libev/conf/config.json
sed -i "s/shadowsocksservice/${shadowsocksservice}/" ${BASEDIR}/conf/post-config.d/cupdate_iptables

echo "Please input port for shadowsocks-libev"
read -p "(Default port: 32000):" shadowsocksport
[ -z "${shadowsocksport}" ] && shadowsocksport="32000"
sed -i "s/shadowsocksport/${shadowsocksport}/" ${BASEDIR}/tools/shadowsocks-libev/conf/config.json
sed -i "s/shadowsocksport/${shadowsocksport}/" ${BASEDIR}/conf/post-config.d/cupdate_iptables

echo "Please input password for shadowsocks-libev"
read -p "(Default password: 123456):" shadowsockspwd
[ -z "${shadowsockspwd}" ] && shadowsockspwd="123456"
sed -i "s/shadowsockspwd/${shadowsockspwd}/" ${BASEDIR}/tools/shadowsocks-libev/conf/config.json

echo "Please input method for shadowsocks-libev"
read -p "(Default method: rc4-md5):" shadowsocksmethod
[ -z "${shadowsocksmethod}" ] && shadowsocksmethod="rc4-md5"
sed -i "s/shadowsocksmethod/${shadowsocksmethod}/" ${BASEDIR}/tools/shadowsocks-libev/conf/config.json

cp -f ${BASEDIR}/conf/post-config.d/update_iptables /config/scripts/post-config.d
cp -r -f ${BASEDIR}/conf/schedule /config/scripts/

. ${BASEDIR}/chinadns/install.sh
. ${BASEDIR}/dnsmasq/install.sh
. ${BASEDIR}/shadowsocks-libev/install.sh
