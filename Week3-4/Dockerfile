FROM ubuntu:22.04
RUN yes | unminimize
RUN apt-get update \
    && apt-get install -y \
    locales \
    vim \
    tmux \
    less \
    tree \
    git \
    tar \
    grep \
    sudo \
    gnupg \
    man-db manpages-ja manpages-ja-dev
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata 
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo
WORKDIR /linux-study