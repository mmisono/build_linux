FROM ubuntu:focal

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
      libncurses-dev \
      flex \
      bison \
      bc \
      openssl \
      libssl-dev \
      dkms \
      libelf-dev \
      libudev-dev \
      libpci-dev \
      libiberty-dev \
      libdw-dev \
      elfutils \
      autoconf \
      pkg-config \
      debootstrap \
      cpio \
      git \
      vim \
      tmux \
      cmake \
      wget \
      bear

WORKDIR /work

# Instal latest dwarves for BTF generation
RUN git clone --recursive https://github.com/acmel/dwarves && \
    mkdir -p dwarves/build && \
    cd dwarves/build && \
    git checkout refs/tags/v1.18 && \
    cmake -D__LIB=lib .. && \
    make install && \
    ldconfig

# Install libbpf
RUN git clone https://github.com/libbpf/libbpf && \
    cd libbpf/src && \
    make install

COPY create-image.sh .
COPY build_linux.sh .

ENTRYPOINT /bin/bash
