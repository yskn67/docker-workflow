FROM alpine:3.6
MAINtAINER yskn67

ENV AIRFLOW_HOME /home/airflow/airflow

RUN adduser -h /home/airflow -s /bin/sh -D -g airflow airflow
RUN echo "airflow ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \
    && echo "airflow:airflow" | chpasswd
RUN apk add --update sudo linux-headers curl gcc g++ libxml2 libxml2-dev libxslt-dev python3 python3-dev \
    && rm -rf /var/cache/apk/* \
    && ln -s /usr/include/locale.h /usr/include/xlocale.h \
    && pip3 install virtualenv
RUN su airflow \
    && cd /home/airflow \
    && virtualenv -p /usr/bin/python3 airflow_python \
    && . airflow_python/bin/activate \
    && pip3 install airflow \
    && airflow initdb
RUN cd /home/airflow \
    && chown -R airflow:airflow airflow
COPY endpoint.sh /home/airflow/

EXPOSE 8080
USER airflow
WORKDIR /home/airflow
ENTRYPOINT sh endpoint.sh
