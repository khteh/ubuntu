FROM ubuntu:23.04
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y --fix-missing
RUN apt upgrade -y
RUN apt install -y software-properties-common apt-transport-https python3 awscli curl sudo gnupg mysql-client dnsutils wget git nodejs npm
RUN echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget -q -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN apt update -y --fix-missing
RUN apt upgrade -y
RUN apt install -y postgresql-client
RUN wget -q https://download.oracle.com/java/20/latest/jdk-20_linux-x64_bin.deb
RUN apt -qqy install ./jdk-20_linux-x64_bin.deb
RUN rm -f jdk-20_linux-x64_bin.deb
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-20/bin/java 2020
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN curl -sL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
#https://www.rabbitmq.com/management-cli.html to find out the latest version
ENV RABBITMQ_VER="3.11.14"
RUN wget -q https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v$RABBITMQ_VER/deps/rabbitmq_management/bin/rabbitmqadmin -O /usr/local/bin/rabbitmqadmin
RUN chmod +x /usr/local/bin/rabbitmqadmin
RUN apt install -y golang-go redis-tools
ENV DOCKER_CLIENT_VER 24.0.1
RUN curl -sL -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$DOCKER_CLIENT_VER.tgz
RUN tar -xz -C /tmp -f /tmp/docker-$VER.tgz
RUN mv /tmp/docker/* /usr/local/bin
#https://github.com/fullstorydev/grpcurl/releases
ENV GRPCURL_VER="1.8.7"
RUN wget -q https://github.com/fullstorydev/grpcurl/releases/download/v$GRPCURL_VER/grpcurl_${GRPCURL_VER}_linux_x86_64.tar.gz
RUN tar -xvf grpcurl_${GRPCURL_VER}_linux_x86_64.tar.gz -C /usr/local/bin
RUN rm -f grpcurl_${GRPCURL_VER}_linux_x86_64.tar.gz
RUN npm install -g n yarn
RUN n latest
#ENTRYPOINT ["bash"]
CMD ["/bin/bash"]
