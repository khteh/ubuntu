FROM ubuntu:19.10
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
RUN apt update -y --fix-missing
RUN apt install -y curl mysql-client dnsutils python3 wget
RUN wget -q https://raw.githubusercontent.com/rabbitmq/rabbitmq-management/v3.7.8/bin/rabbitmqadmin -o /usr/local/bin/rabbitmqadmin
#ENTRYPOINT ["bash"]
CMD ["/bin/bash"]
