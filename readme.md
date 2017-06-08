Usage:

	1. Enter Container
		sudo docker run -it buildroot-docker:latest /bin/bash

	2. make
		cd /home/chenzilin/buildroot/
		make raspberrypi3_defconfig O=/home/chenzilin/buildroot/output/raspberrypi3
		cd /home/chenzilin/buildroot/output/raspberrypi3
		make


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
