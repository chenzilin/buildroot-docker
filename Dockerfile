FROM ubuntu:xenial

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -yqq sudo git-core subversion build-essential gcc-multilib ccache quilt \
                       bzip2 cpio whois patch perl libncurses5-dev zlib1g-dev gawk flex gettext wget unzip python vim libssl-dev \
                       sed tar rsync && \
    apt-get clean && \
    useradd -m chenzilin && \
    echo 'chenzilin ALL=NOPASSWD: ALL' > /etc/sudoers.d/chenzilin

USER chenzilin

RUN cd /home/chenzilin && \
    git clone https://git.busybox.net/buildroot -b 2017.05.x && \
    cd buildroot

WORKDIR /home/chenzilin
