#!/bin/sh
echo "Start to configure dnsmasq..."
BASEDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cp -f ${BASEDIR}/conf/accelerated-domains.china.conf /etc/dnsmasq.d/
cp -f ${BASEDIR}/conf/foreign_list.conf /etc/dnsmasq.d/
cp -f ${BASEDIR}/conf/dnsmasq.conf /etc/
echo "end to configure dnsmasq..."
