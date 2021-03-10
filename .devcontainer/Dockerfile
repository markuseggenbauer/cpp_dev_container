FROM ubuntu:20.04

ARG USERNAME=developer
ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
    apt-utils

RUN apt-get update && apt-get install -y \
    gpgconf \
    openssh-client \
    git \
    git-lfs \
    vim

RUN apt-get update && apt-get install -y \
    build-essential \
    gdb \
    clang \
    clang-format \
    clang-tidy \
    lldb \
    cmake \
    ninja-build \
    ccache \
    python3 \
    python3-pip

RUN apt-get update && apt-get install -y \
    default-jre-headless \
    graphviz \
    asciidoctor \
    plantuml

RUN gem install asciidoctor-diagram
RUN pip3 install cmake_format
RUN pip3 install conan --no-warn-script-location  && \
    conan profile new default --detect && \
    conan profile update settings.compiler.libcxx=libstdc++11 default && \
    conan remote add me-repo https://markuseggenbauer.jfrog.io/artifactory/api/conan/me-conan -i 0 --force

