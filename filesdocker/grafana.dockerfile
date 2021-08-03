FROM ubuntu:bionic

# Instalação
RUN apt-get update 
RUN apt-get install -y wget
RUN wget https://dl.grafana.com/oss/release/grafana-8.0.6.linux-amd64.tar.gz -P /opt
RUN tar xfz /opt/grafana-8.0.6.linux-amd64.tar.gz -C /opt
RUN mv /opt/grafana-8.0.6 /opt/grafana

# Diretórios
RUN mkdir /opt/grafana/data
RUN mkdir /opt/grafana/config

# Entrypoint
ENTRYPOINT [ "/opt/grafana/bin/grafana-server", "-homepath", "/opt/grafana"]

# docker build -f grafana.dockerfile -t tde:grafana .
# docker run -it tde:grafana