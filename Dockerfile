FROM alpine:3.7

LABEL MAINTAINER="Muhammet Furkan DOĞAN"
LABEL Repo="value"

WORKDIR /app

ENV VCL_CONFIG ./vcl/default.vcl
ENV CACHE_SIZE 64m
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600 -a 0.0.0.0:80

RUN apk update && \
    apk upgrade && \
    apk add varnish

ADD ${VCL_CONFIG} /etc/varnish/default.vcl
ADD ./varnish.service /lib/systemd/system/varnish.service
ADD ./scripts/varnish.sh ./varnish.sh

RUN chmod +x ./varnish.sh

EXPOSE 80

CMD ["/bin/sh", "./varnish.sh"]