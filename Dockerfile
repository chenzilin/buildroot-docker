FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq sudo git-core subversion build-essential gcc-multilib ccache quilt \
                       bzip2 cpio whois patch perl libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev \
                       sed tar rsync bc && \
    apt-get clean && \
    useradd -m chenzilin && \
    echo 'chenzilin ALL=NOPASSWD: ALL' > /etc/sudoers.d/chenzilin

USER chenzilin

RUN git config --global user.email "chenzilin115@gmail.com" && \
    git config --global user.name "ZiLin Chen"

RUN cd /home/chenzilin && \
    wget -c --no-check-certificate https://buildroot.org/downloads/buildroot-2017.05.tar.gz && \
    tar xzvfpa buildroot-2017.05.tar.gz && mv buildroot-2017.05 buildroot && rm buildroot-2017.05.tar.gz && \
    cd buildroot/ && git init . && git add -A . && git commit -am "initial commit based on v2017.05"

COPY configs/*_defconfig /home/chenzilin/buildroot/configs/

COPY dl/dl.tar.bz2.* /home/chenzilin/buildroot/
RUN cd /home/chenzilin/buildroot/ && cat dl.tar.bz2.* | tar xvj && rm dl.tar.bz2.*

WORKDIR /home/chenzilin/buildroot
