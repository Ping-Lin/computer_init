#!/bin/sh
# My system IP/set ip address of server
SERVER_IP="XXX.XXX.XXX.XXX"
# Flushing all rules
iptables -F
iptables -X
# Setting default filter policy
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP
# Allow unlimited traffic on loopback
iptables -A INPUT -i lo -j ACCEPT
iptables -A OUTPUT -o lo -j ACCEPT

#only allow ssh
iptables -A INPUT -p tcp --dport 35566 -m state --state NEW -m recent --set
iptables -A INPUT -p tcp --dport 35566 -m state --state NEW -m recent --update --second 1800 --hitcount 3 -j DROP
iptables -A INPUT -p tcp --dport 35566 -m state --state NEW -j ACCEPT

iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -p tcp -m state --state NEW,RELATED,ESTABLISHED -j ACCEPT

# dns
iptables -A OUTPUT -p udp --dport 53 -m state --state NEW -j ACCEPT

# make sure nothing comes or goes out of this box
iptables -A INPUT -j DROP
iptables -A OUTPUT -j DROP
