FROM dylanlindgren/docker-phpcli:latest

MAINTAINER "Dylan Lindgren" <dylan.lindgren@gmail.com>

WORKDIR /tmp

RUN apt-get update -y && \
    apt-get install -y wget php5-mcrypt && \
    wget https://phar.phpunit.de/phpunit.phar && \
    apt-get remove -y wget && \
    rm -rf /var/lib/apt/lists/* && \
    chmod +x phpunit.phar && \
    mv phpunit.phar /usr/local/bin/phpunit

RUN mkdir -p /data/www
VOLUME ["/data"]
WORKDIR /data/www

ENTRYPOINT ["phpunit"]
