FROM alpine:3.16.2

ARG TUIC_VERSION=0.8.5
ARG ARCH=x86_64-linux-musl

WORKDIR /etc/tuic

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&&  apk --no-cache add curl \
&&  curl -L https://github.com/EAimTY/tuic/releases/download/${TUIC_VERSION}/tuic-client-${TUIC_VERSION}-${ARCH} \
    -o /usr/bin/tuic-client \
&&  chmod +x /usr/bin/tuic-client

ENTRYPOINT ["tuic-client"]
CMD ["-c", "/etc/tuic/config.json"]