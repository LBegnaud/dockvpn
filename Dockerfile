FROM ubuntu:bionic
RUN apt-get update -q
RUN apt-get install -qy openvpn iptables socat curl
ADD ./bin /usr/local/sbin
ADD ./bin /openvpn-azure-ad-auth
VOLUME /etc/openvpn
EXPOSE 443/tcp 1194/udp 8080/tcp
CMD run
