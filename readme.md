Usage:

	1. First Enter Container
		sudo docker run -it buildroot-docker:latest /bin/bash

	2. make
		make raspberrypi3_base_defconfig O=/home/chenzilin/buildroot/output/raspberrypi3_base
		cd /home/chenzilin/buildroot/output/raspberrypi3_base
		make or make menuconfig
		make savedefconfig BR2_DEFCONFIG=configs/raspberrypi3_base_defconfig

		make raspberrypi3_qt5_defconfig O=/home/chenzilin/buildroot/output/raspberrypi3_qt5
		cd /home/chenzilin/buildroot/output/raspberrypi3_qt5
		make or make menuconfig
		make savedefconfig BR2_DEFCONFIG=configs/raspberrypi3_qt5_defconfig

	3. Enter Exited Container
		sudo docker ps -a
		sudo docker start -ia 57c5d096ec6b


Reference:

Create Image:

	cd buildroot-docker/

	sudo docker build -t buildroot-docker .

List Images:

	sudo docker images

Remeve Image:

	sudo docker rmi 7d9495d03763

	sudo docker image remove 7d9495d03763

Run Container:

	sudo docker run -it buildroot-docker:latest /bin/bash

List Containers:

	sudo docker ps

	sudo docker ps -a

Remove Container:

	sudo docker rm d48b68282c03

Partition Tar:

	tar cvjfa - dl/ |split -b 85m - dl.tar.bz2.

	cat dl.tar.bz2.a* | tar xvj
