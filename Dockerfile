FROM debian:testing-slim

LABEL maintainer="Jeremías Casteglione <jrmsdev@gmail.com>"
LABEL version="19.6.29"

RUN useradd -U -c alfred -d /home/alfred -m -s /bin/bash alfred

ENV DEBIAN_FRONTEND noninteractive

COPY docker/apt-proxy.conf /etc/apt/apt.conf.d/02proxy

RUN apt-get clean
RUN apt-get update
RUN apt-get dist-upgrade -yy --purge

RUN apt-get install -yy --no-install-recommends golang

RUN apt-get clean
RUN apt-get autoremove -yy --purge

RUN rm -rf /var/lib/apt/lists/*
RUN rm -f /var/cache/apt/archives/*.deb
RUN rm -f /var/cache/apt/*cache.bin

RUN echo "PS1='root@docker:\W# '" >>/root/.bashrc

ENV GOPATH /go
ENV SRCDIR /go/src/github.com/jrmsdev/alfred

RUN (umask 027 && mkdir -vp ${SRCDIR})
RUN chmod 750 /go
RUN chown -R alfred:alfred /go

COPY docker/entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod -v 555 /usr/local/bin/docker-entrypoint.sh

USER alfred:alfred

RUN echo '### alfred setup' >>/home/alfred/.bashrc
RUN echo 'umask 027' >>/home/alfred/.bashrc
RUN echo "PS1='alfred@docker:\W\$ '" >>/home/alfred/.bashrc
RUN echo 'export PATH=/go/bin:${PATH}' >>/home/alfred/.bashrc

WORKDIR ${SRCDIR}
CMD /usr/local/bin/docker-entrypoint.sh
