FROM alpine

ARG FRP_VERSION=0.41.0

LABEL maintainer="madwind.cn@gmail.com" \
        org.label-schema.name="frps" \
        org.label-schema.version=$FRP_VERSION

COPY rootfs /

RUN apk add --no-cache tzdata && \
    wget https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    tar -zxf frp_${FRP_VERSION}_linux_amd64.tar.gz && \
    cd frp_${FRP_VERSION}_linux_amd64 && \
    mkdir /frps && \
    mkdir /config && \
    mv frps frps_full.ini /frps && \
    cd .. && \
    rm -rf *.tar.gz frp_${FRP_VERSION}_linux_amd64 && \
   	echo "Asia/Shanghai" >  /etc/timezone && \
    chmod +x /usr/bin/entrypoint.sh && \
    rm -rf /var/cache/apk/*

ENTRYPOINT ["/usr/bin/entrypoint.sh"]
