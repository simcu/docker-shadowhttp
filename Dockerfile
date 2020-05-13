FROM alpine
COPY run.sh /run.sh
RUN apk add --update python3 privoxy \
    && pip3 install shadowsocks \
    && rm -rf /var/cache/apk/* \
    && echo "listen-address 0.0.0.0:8118" > /etc/privoxy/config \
	&& echo "debug 1" >> /etc/privoxy/config \
	&& echo "forward-socks5 / 127.0.0.1:1080 ." >> /etc/privoxy/config \
	&& chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
EXPOSE  8118