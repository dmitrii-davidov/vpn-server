FROM ubuntu:16.04


RUN apt-get update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y upgrade \
    && DEBIAN_FRONTEND=noninteractive apt-get -y install strongswan libcharon-extra-plugins iptables uuid-runtime ndppd openssl

ADD ./bin/* /usr/bin/
ADD ./etc/* /etc/

ADD ./cert/anabatik-vpn.westeurope.cloudapp.azure.com.crt /etc/ipsec.d/certs/
ADD ./cert/anabatik-vpn.westeurope.cloudapp.azure.com.key /etc/ipsec.d/private/
ADD ./cert/ca.crt /etc/ipsec.d/cacerts/

EXPOSE 500/udp 4500/udp

CMD /usr/bin/start-vpn
