#!/bin/sh
echo "Start to configure dnsmasq..."
cp -f ./conf/dnsmasq.d/accelerated-domains.china.conf /etc/dnsmasq.d/
cp -f ./conf/dnsmasq.d/foreign_list.conf /etc/dnsmasq.d/
cp -f ./conf/dnsmasq.d/dnsmasq.conf /etc/
echo "end to configure dnsmasq..."
