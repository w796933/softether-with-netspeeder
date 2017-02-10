FROM combro2k/softether
MAINTAINER endokai
RUN apt-get update && \
    apt-get install -y libnet1 build-essential libnet1-dev libpcap0.8 libpcap0.8-dev git

RUN git clone https://github.com/snooda/net-speeder.git net-speeder
WORKDIR net-speeder
RUN sh build.sh

RUN mv net_speeder /usr/local/bin/
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/net_speeder

EXPOSE 443/tcp 992/tcp 1194/tcp 1194/udp 5555/tcp

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
