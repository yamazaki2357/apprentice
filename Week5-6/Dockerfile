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
    man-db manpages-ja manpages-ja-dev \
    mysql-server

RUN DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata 
RUN locale-gen ja_JP.UTF-8
ENV LANG=ja_JP.UTF-8
ENV TZ=Asia/Tokyo

# 環境変数を設定
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
ENV MYSQL_DATABASE=mydb
ENV MYSQL_USER=myuser
ENV MYSQL_PASSWORD=mypassword

# ポートを公開
EXPOSE 3306

# MySQLサーバーを起動するコマンド
CMD ["mysqld"]
