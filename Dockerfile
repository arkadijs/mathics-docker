FROM debian:7
MAINTAINER Arkadi Shishlov <arkadi.shishlov@gmail.com>
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y python-dev python-setuptools libsqlite3-dev libgmp3-dev wget unzip \
    && apt-get clean \
    && find /var/lib/apt/lists -type f -delete \
    && cd tmp \
    && wget --no-check-certificate https://github.com/poeschko/Mathics/archive/master.zip \
    && unzip -q master.zip \
    && cd Mathics-master \
    && sed -ri -e "s/('django)>=/\\1==/" setup.py \
    && python setup.py install \
    && groupadd -r mathics \
    && useradd -r -m -g mathics mathics \
    && su - mathics -c 'cd /tmp/Mathics-master && python setup.py initialize' \
    && rm -rf /tmp/master.zip /tmp/Mathics-master /var/cache/apt/* /var/lib/apt/lists/*
EXPOSE 8000
CMD [ "su", "-", "mathics", "-c", "exec mathicsserver --external"]
