FROM index.alauda.cn/library/ubuntu:16.04
MAINTAINER	chenishr@gmail.com

#####################################
# 非 root 用户 :
# Add a non-root user to prevent files being created with root permissions on host machine.
#####################################
ARG PUID=1000
ARG PGID=1000
RUN groupadd -g $PGID chenishr \
	   && useradd -u $PUID -g chenishr -m chenishr


##########################################
# 安装 vim git 和一些编译工具和依赖包
##########################################
RUN apt-get update && \
	apt-get install -y vim && \
	apt-get install -y git 


####################################
# 安装编译工具和依赖包
####################################
USER	root
RUN	apt-get install -y \
		build-essential \
		gcc \
		g++ \
		autoconf \
		libiconv-hook-dev \
		libmcrypt-dev \
		libxml2-dev \
		libmysqlclient-dev \
		libcurl4-openssl-dev \
		libjpeg8-dev \
		libpng12-dev \
		libfreetype6-dev \
		libssl-dev \
	&& ln -s /usr/lib/x86_64-linux-gnu/libssl.so /usr/lib


##################################
# 按装 PHP
#################################
USER	root
COPY	php-7.1.6.tar.gz /tmp/
RUN		cd /opt \
		&& tar -zxf /tmp/php-7.1.6.tar.gz \
			&& (\
				cd php-7.1.6 \
				&&	./configure --prefix=/usr/local/php \
					--with-config-file-path=/etc/php \
					--enable-fpm \
					--enable-pcntl \
					--enable-mysqlnd \
					--enable-opcache \
					--enable-sockets \
					--enable-sysvmsg \
					--enable-sysvsem \
					--enable-sysvshm \
					--enable-shmop \
					--enable-zip \
					--enable-soap \
					--enable-xml \
					--enable-mbstring \
					--disable-rpath \
					--disable-debug \
					--disable-fileinfo \
					--with-mysql=mysqlnd \
					--with-mysqli=mysqlnd \
					--with-pdo-mysql=mysqlnd \
					--with-pcre-regex \
					--with-iconv \
					--with-zlib \
					--with-mcrypt \
					--with-gd \
					--with-openssl \
					--with-mhash \
					--with-xmlrpc \
					--with-curl \
					--with-imap-ssl \
				&& make \
				&& make install \
				&& mkdir -p /etc/php \
				) \
			&& rm /tmp/php-7.1.6.tar.gz \
			&& echo "" >> ~/.bashrc \
			&& echo 'export PATH="/usr/local/php/bin:$PATH"' >> ~/.bashrc \
			&& echo 'export PATH="/usr/local/php/sbin:$PATH"' >> ~/.bashrc

########################################
# 设置用户 chenishr 的环境变量
########################################
USER	chenishr
RUN		echo "" >> ~/.bashrc \
			&& echo 'export PATH="/usr/local/php/bin:$PATH"' >> ~/.bashrc \
			&& echo 'export PATH="/usr/local/php/sbin:$PATH"' >> ~/.bashrc

#######################################
# 安装 swoole 
######################################
USER	root
COPY	swoole-src-1.9.14.tar.gz /tmp/
RUN		cd /opt \
		&& tar -zxf /tmp/swoole-src-1.9.14.tar.gz \
		&& ( \
			cd swoole-src-1.9.14 \
			&& /usr/local/php/bin/phpize \
			&& ./configure --with-php-config=/usr/local/php/bin/php-config \
			&& make \
			&& make install \
		   ) \
		&& rm /tmp/swoole-src-1.9.14.tar.gz \
		&& echo "" >> /etc/php/php.ini \
		&& echo "extension=swoole.so" >> /etc/php/php.ini


#######################################
# 清除数据
#######################################
#USER	root
#RUN		apt-get clean \
#		&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# 容器的启动脚本,运行一个挂起的命令，保持容器不自动退出
USER	root
COPY	my_init.sh /sbin/my_init.sh
RUN		chmod 755 /sbin/my_init.sh

WORKDIR /var/www/html
ENTRYPOINT	["/sbin/my_init.sh"]
