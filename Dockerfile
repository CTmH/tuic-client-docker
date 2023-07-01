FROM alpine:3.16.2

ARG TUIC_VERSION=1.0.0
ARG ARCH=x86_64-linux-musl

WORKDIR /etc/tuic

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g' /etc/apk/repositories \
&&  apk --no-cache add curl \
&&  curl -L https://github.com/EAimTY/tuic/releases/download/tuic-client-1.0.0/tuic-client-1.0.0-x86_64-unknown-linux-musl \
#&&  curl -L https://github.com/EAimTY/tuic/releases/download/tuic-client-${TUIC_VERSION}/tuic-client-${TUIC_VERSION}-${ARCH}-unknown-linux-musl \
    -o /usr/bin/tuic-client \
&&  chmod +x /usr/bin/tuic-client
ENTRYPOINT ["tuic-client"]
CMD ["-c", "/etc/tuic/config.json"]