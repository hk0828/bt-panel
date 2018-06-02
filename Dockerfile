FROM centos:7
MAINTAINER hk0828 <hk0828@vip.qq.com>
RUN yum -y update \
 && yum -y install wget net-tool openssh-server; yum clean all
RUN yum list | grep initscripts
RUN yum install initscripts -y
RUN wget -O install.sh http://download.bt.cn/install/install.sh \
 && printf "y\n0"|bash ./install.sh
RUN mkdir -p /usr/src/www \
  && cp -a /www/* /usr/src/www/
ADD ./start.sh /start.sh
EXPOSE 20 21 22 80 443 888 3306 8888
CMD bash start.sh && /usr/sbin/sshd -D