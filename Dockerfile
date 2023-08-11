FROM alpine:3.18
LABEL maintainer="bdnr"

WORKDIR /app

RUN apk add --update --no-cache bash openvpn iptables tcpdump busybox-extras curl

RUN echo "net.ipv4.ip_forward = 1" >> /etc/sysctl.d/ipv4.conf
COPY run.sh .

CMD ["/app/run.sh"]