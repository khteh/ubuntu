FROM ubuntu:19.04
MAINTAINER Kok How, Teh <funcoolgeeek@gmail.com>
RUN apt update -y --fix-missing
RUN apt install -y curl mysql-client
#ENTRYPOINT ["bash"]
CMD ["/bin/bash"]
