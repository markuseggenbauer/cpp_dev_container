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

RUN pip3 install conan --no-warn-script-location
RUN pip3 install cmake_format


# common documentation tools
RUN apt-get update && apt-get install -y \
    default-jre-headless \
    graphviz \
    asciidoctor \
    plantuml

RUN gem install asciidoctor-diagram

RUN adduser ${USERNAME} --quiet

USER ${USERNAME}

COPY scripts /home/${USERNAME}/scripts
