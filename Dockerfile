FROM    ubuntu:latest
MAINTAINER      Fisher "wenjx2009@foxmail.com"

RUN apt-get update  \
    && apt-get install --no-install-recommends --no-install-suggests -q -y \
        python3 \
        python3-pip \
    &&  pip3 install jupyter
EXPOSE  8888
CMD     jupyter notebook --allow-root &
