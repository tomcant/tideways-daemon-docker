FROM alpine:3.11

ARG TIDEWAYS_VERSION

RUN apk add --no-cache curl ca-certificates \
 && curl -o /tmp/tideways-daemon.tar.gz -D - -L -s "https://s3-eu-west-1.amazonaws.com/tideways/daemon/${TIDEWAYS_VERSION}/tideways-daemon_linux_amd64-${TIDEWAYS_VERSION}.tar.gz" \
 && tar zxpf /tmp/tideways-daemon.tar.gz --strip-components 1 -C /tmp/ \
 && mv /tmp/tideways-daemon /opt \
 && chmod +x /opt/tideways-daemon \
 && mkdir /var/run/tideways /lib64 \
 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2 \
 && rm -rf /tmp/*

ENV TIDEWAYS_ENV=production
ENV TIDEWAYS_HOSTNAME=tideways-daemon

ENTRYPOINT /opt/tideways-daemon --env=${TIDEWAYS_ENV} --hostname=${TIDEWAYS_HOSTNAME} --address=0.0.0.0:9135
