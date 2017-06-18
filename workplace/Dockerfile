FROM index.alauda.cn/library/ubuntu:14.04
MAINTAINER	chenishr@gmail.com

# 安装 vim git
RUN apt-get update && \
		apt-get install -y vim && \
		apt-get install -y git

# 容器的启动脚本,运行一个挂起的命令，保持容器不自动退出
COPY	my_init.sh /sbin/my_init.sh
RUN		chmod 755 /sbin/my_init.sh

WORKDIR /var/www/html
ENTRYPOINT	["/sbin/my_init.sh"]
