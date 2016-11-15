FROM alpine
COPY get-pip.py /home/get-pip.py
COPY run.sh /run.sh
RUN apk add --update python privoxy \
	&& python /home/get-pip.py \
    && pip install shadowsocks \
    && rm -rf /var/cache/apk/* \
    && rm /home/get-pip.py \
    && echo "listen-address 0.0.0.0:8118" > /etc/privoxy/config \
	&& echo "debug 1" >> /etc/privoxy/config \
	&& echo "forward-socks5 / 127.0.0.1:1080 ." >> /etc/privoxy/config \
	&& chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
EXPOSE  8118