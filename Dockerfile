FROM ubuntu:22.10
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y --fix-missing
RUN apt install -y software-properties-common apt-transport-https python3 awscli curl sudo gnupg mysql-client dnsutils wget git
RUN wget -q https://download.oracle.com/java/19/latest/jdk-19_linux-x64_bin.deb
RUN apt -qqy install ./jdk-19_linux-x64_bin.deb
RUN update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-19/bin/java 1919
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN curl -sL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
#https://www.rabbitmq.com/management-cli.html to find out the latest version
RUN wget -q https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.11.2/deps/rabbitmq_management/bin/rabbitmqadmin -o /usr/local/bin/rabbitmqadmin
RUN apt install -y golang-go redis-tools
#ENTRYPOINT ["bash"]
CMD ["/bin/bash"]
