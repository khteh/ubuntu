FROM ubuntu:22.04
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y --fix-missing
RUN apt install -y software-properties-common apt-transport-https python3 awscli curl sudo gnupg mysql-client dnsutils wget git
RUN add-apt-repository ppa:linuxuprising/java
RUN apt update -y
RUN echo oracle-java17-installer shared/accepted-oracle-license-v1-3 select true | sudo /usr/bin/debconf-set-selections
RUN apt install -y oracle-java17-installer
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
# https://docs.aws.amazon.com/eks/latest/userguide/install-aws-iam-authenticator.html
RUN curl -so /usr/local/bin/aws-iam-authenticator https://s3.us-west-2.amazonaws.com/amazon-eks/1.21.2/2021-07-05/bin/linux/amd64/aws-iam-authenticator
RUN chmod +x /usr/local/bin/aws-iam-authenticator
RUN curl -sL -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
#https://www.rabbitmq.com/management-cli.html to find out the latest version
RUN wget -q https://raw.githubusercontent.com/rabbitmq/rabbitmq-server/v3.9.15/deps/rabbitmq_management/bin/rabbitmqadmin -o /usr/local/bin/rabbitmqadmin
#ENTRYPOINT ["bash"]
CMD ["/bin/bash"]
