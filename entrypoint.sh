#!/bin/bash

nohup /usr/local/bin/net_speeder eth0 "ip" >/dev/null 2>&1 &
if [ ! -d /var/log/vpnserver ]; then
    mkdir -p /var/log/vpnserver
fi

if [ ! -d /opt/vpnserver/packet_log ]; then
    ln -s /var/log/vpnserver /opt/vpnserver/packet_log
fi

if [ ! -d /opt/vpnserver/security_log ]; then
    ln -s /var/log/vpnserver /opt/vpnserver/security_log
fi

if [ ! -d /opt/vpnserver/server_log ]; then
    ln -s /var/log/vpnserver /opt/vpnserver/server_log
fi

/usr/bin/supervisord -c /etc/supervisor/supervisord.conf
