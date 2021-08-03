FROM ubuntu:bionic

# Instalação
RUN apt-get update 
RUN apt-get install -y wget
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-1.19.2_linux_amd64.tar.gz -P /opt
RUN tar xf /opt/telegraf-1.19.2_linux_amd64.tar.gz -C /opt
RUN mv /opt/telegraf-1.19.2 /opt/telegraf

# Entrypoint
ENTRYPOINT [ "/opt/telegraf/usr/bin/telegraf" ]


# docker build -f telegraf.dockerfile -t tde:telegraf .
# docker run -it tde:telegraf