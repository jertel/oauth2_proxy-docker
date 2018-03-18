FROM alpine

RUN wget -qO oauth2_proxy.tar.gz https://github.com/bitly/oauth2_proxy/releases/download/v2.2/oauth2_proxy-2.2.0.linux-amd64.go1.8.1.tar.gz \
 && tar xf oauth2_proxy.tar.gz --strip 1 -C /usr/local/bin \
 && adduser -D oauth2_proxy \
 && touch /var/log/oauth2_proxy.log \
 && chown oauth2_proxy /var/log/oauth2_proxy.log \
 && apk add --no-cache --virtual .run-deps bash ca-certificates

ADD start.sh /

USER oauth2_proxy

ENTRYPOINT ["/start.sh"]