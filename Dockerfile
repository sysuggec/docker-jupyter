FROM python:3.9-slim-buster
MAINTAINER      Fisher "wenjx2009@foxmail.com"

# 修改 apt-get 源为阿里云镜像源
RUN sed -i 's#http://deb.debian.org#http://mirrors.aliyun.com#g' /etc/apt/sources.list \
    && apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        libssl-dev \
        libffi-dev \
        python3-dev \
        python3-pip \
    && pip3 install --no-cache-dir -i https://mirrors.aliyun.com/pypi/simple/ jupyter \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

EXPOSE  8888
CMD     jupyter notebook --allow-root &
