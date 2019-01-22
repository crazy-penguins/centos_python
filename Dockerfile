FROM centos:7
ENV container docker
WORKDIR /work
SHELL [ "/bin/bash", "-c" ]
COPY NAME .
COPY VERSION .
COPY centos_python.sh .
RUN cat ./NAME > /etc/docker.conf \
  && printf ":" >> /etc/docker.conf \
  && cat ./VERSION >> /etc/docker.conf \
  && rm -rf VERSION NAME \
  && cat /etc/docker.conf \
  && mkdir -p /u \
  && chmod 0755 centos_python.sh
RUN yum -q -y updateinfo \
  && yum -y -q install epel-release \
  && yum -q -y install make gdbm-devel gcc gcc-c++ zip wget bzip2-devel \
    zlib-devel openssl-devel ncurses-devel sqlite-devel tk-devel \
    xz-devel expat-devel libffi-devel readline-devel python python-pip \
  && pip install -q --no-cache-dir awscli \
  && yum -q -y clean all \
  && rm -rf /var/cache/yum
