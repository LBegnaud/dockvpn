FROM ubuntu:bionic
RUN apt-get update -q
RUN apt-get install -qy python-pip openvpn iptables socat curl && pip install adal pyyaml requests backports.pbkdf2
ADD ./bin /usr/local/sbin
ADD ./openvpn-azure-ad-auth-master /openvpn-azure-ad-auth
RUN chmod a+x /openvpn-azure-ad-auth/openvpn-azure-ad-auth.py
VOLUME /etc/openvpn
EXPOSE 443/tcp 1194/udp 8080/tcp
CMD run
