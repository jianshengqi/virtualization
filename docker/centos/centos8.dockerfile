FROM centos:8

WORKDIR /lab

COPY scripts .

RUN set -ex \
        && chmod +x *.sh \
        && ./common.sh \
        && ./cpp.sh \
        && ./go.sh \
        && ./bcc.sh \
        && ./gitbook3.sh \
        && rm -rf *.sh