FROM ubuntu:bionic

# Instalação
RUN apt-get update 
RUN apt-get install -y wget
RUN wget https://dl.influxdata.com/influxdb/releases/influxdb-1.8.7_linux_amd64.tar.gz -P /opt
RUN tar xfz /opt/influxdb-1.8.7_linux_amd64.tar.gz -C /opt
RUN mv /opt/influxdb-1.8.7-1 /opt/influxdb

# Diretórios
RUN mkdir /etc/influxdb && mkdir /var/lib/influxdb 
RUN mkdir /var/lib/influxdb/meta 
RUN mkdir /var/lib/influxdb/data
RUN mkdir /var/lib/influxdb/wal

# Entrypoint
ENTRYPOINT [ "/opt/influxdb/usr/bin/influxd","run" ]

# docker build -f influxdb.dockerfile -t tde:influxdb .
# docker run -it tde:influxdb