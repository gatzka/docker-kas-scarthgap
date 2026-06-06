FROM ubuntu:24.04

LABEL maintainer="Stephan Gatzka <stephan.gatzka@gmail.com>"

LABEL org.opencontainers.image.authors="Stephan Gatzka <stephan.gatzka@gmail.com>"
LABEL org.opencontainers.image.source="https://github.com/gatzka/docker-kas-scarthgap"
LABEL org.opencontainers.image.description="kas-based build environment for yocto scarthgap"
LABEL org.opencontainers.image.licenses=MIT

ARG DEBIAN_FRONTEND=noninteractive

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

RUN apt-get -y update \
    && apt-get -y install \
        avahi-utils \
        build-essential \
        chrpath \
        cpio \
        curl \
        debianutils \
        diffstat \
        elfutils \
        file \
        gawk \
        gcc \
        git \
        git-lfs \
        iproute2 \
        iputils-ping \
        kas \
        libacl1 \
        liblz4-tool \
        locales \
        nmap \
        openssh-client \
        python3 \
        python3-git \
        python3-jinja2 \
        python3-pexpect \
        python3-pip \
        python3-subunit \
        socat \
        systemd \
        texinfo \
        unzip \
        wget \
        xz-utils \
        zstd \
    && rm -rf /var/lib/apt/lists/*

RUN echo "en_US.UTF-8 UTF-8" > /etc/locale.gen && locale-gen
ENV LANG=en_US.utf8

RUN groupadd build
RUN useradd -ms /bin/bash -p build build -g build
USER build
WORKDIR /home/build

