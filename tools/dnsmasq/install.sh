#!/bin/sh
echo "Start to configure dnsmasq..."
cp -f ./conf/accelerated-domains.china.conf /etc/dnsmasq.d/
cp -f ./conf/foreign_list.conf /etc/dnsmasq.d/
cp -f ./conf/dnsmasq.conf /etc/
echo "end to configure dnsmasq..."
