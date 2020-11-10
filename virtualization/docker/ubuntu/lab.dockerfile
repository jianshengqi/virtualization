FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

WORKDIR /lab

COPY scripts .

RUN set -eux \
        && chmod +x *.sh \
        && ./bcc_compile.sh.sh \
        && ./final.sh \
        && rm -rf *.sh

ENTRYPOINT ["/usr/bin/dumb-init", "--"]