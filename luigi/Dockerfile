FROM alpine:3.6
MAINtAINER yskn67

RUN adduser -h /home/luigi -s /bin/sh -D -g luigi luigi
RUN echo "luigi ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "luigi:luigi" | chpasswd
RUN apk add --update sudo linux-headers curl gcc g++ libxml2 libxml2-dev libxslt-dev python3 python3-dev \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip3 install virtualenv
RUN su luigi \
    && cd /home/luigi \
    && virtualenv -p /usr/bin/python3 luigi_python \
    && . luigi_python/bin/activate \
    && pip3 install luigi
COPY endpoint.sh /home/luigi/

EXPOSE 8082
USER luigi
WORKDIR /home/luigi
ENTRYPOINT sh endpoint.sh
