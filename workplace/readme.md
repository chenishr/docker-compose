###	建立基础镜像

>	在基础镜像上面添加了 vim git 和保持挂起的一个进程

	sudo docker build -f Dockerfile_0.01 -t workplace:v0.01 .

#### 基于基础镜像添加一下东西

>	安装 PHP

	sudo docker build -f Dockerfile_0.02 -t workplace:v0.02 .

#### 在之前的基础上安装 swoole 

>	安装 swoole

	sudo docker build -f Dockerfile_0.03 -t workplace:v0.03 .

#### 在之前的基础上安装 composer

>	安装 composer

	sudo docker build -f Dockerfile_0.04 -t workplace:v0.04 .

###	前面的镜像合并起来

>	配置 vim 运行 xdebug  
>	需要在容器里面在安装 python2 ，执行以下命令即可：

	// 
	apt-get install vim-nox-py2

	// 编译生成镜像
	sudo docker build -t workplace:v0.12 .

