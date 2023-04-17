FROM ubuntu:22.10
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y --fix-missing
RUN apt install -y software-properties-common apt-transport-https python3 awscli curl sudo gnupg mysql-client dnsutils wget git
RUN echo "deb http://apt.postgresql.org/pub/repos/apt kinetic-pgdg main" > /etc/apt/sources.list.d/pgdg.list
RUN wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
RUN apt update -y --fix-missing
RUN apt install -y postgresql-client
RUN wget -q https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb
RUN apt -qqy install ./jdk-19_linux-x64_bin.deb
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-19/bin/java 1919
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN curl -sL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
#https://www.rabbitmq.com/management-cli.html to find out the latest version
RUN wget -q https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.11.2/deps/rabbitmq_management/bin/rabbitmqadmin -o /usr/local/bin/rabbitmqadmin
RUN apt install -y golang-go redis-tools
ENV VER="23.0.1"
RUN curl -sL -o /tmp/docker-$VER.tgz https://download.docker.com/linux/static/stable/x86_64/docker-$VER.tgz
RUN tar -xz -C /tmp -f /tmp/docker-$VER.tgz
RUN mv /tmp/docker/* /usr/local/bin
#https://github.com/fullstorydev/grpcurl/releases
ENV GRPCURL_VER="1.8.7"
RUN wget -q https://github.com/fullstorydev/grpcurl/releases/download/v$GRPCURL_VER/grpcurl_${GRPCURL_VER}_linux_x86_64.tar.gz
RUN tar -xvf grpcurl_${GRPCURL_VER}_linux_x86_64.tar.gz -C /usr/local/bin
#ENTRYPOINT ["bash"]
CMD ["/bin/bash"]
