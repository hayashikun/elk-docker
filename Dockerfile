FROM ubuntu:latest

RUN apt-get update \
    && apt-get install -y \
        git \
        vim \
        curl \
        build-essential \
        gcc \
        gfortran \
        openmpi-doc \
        openmpi-bin \
        libopenmpi-dev

WORKDIR /usr/local/src


## Elk installation
RUN curl https://astuteinternet.dl.sourceforge.net/project/elk/elk-6.3.2.tgz -O -L
RUN tar xvf elk-6.3.2.tgz \
    && rm -rf elk-6.3.2.tgz
COPY res/make.inc ./elk-6.3.2
RUN cd elk-6.3.2/ && make
ENV ELK /usr/local/src/elk-6.3.2/src/elk

WORKDIR /root
