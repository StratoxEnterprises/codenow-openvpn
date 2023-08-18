FROM alpine:3.18

WORKDIR /app

RUN apk add --update --no-cache openvpn iptables curl # bash tcpdump busybox-extras

COPY run.sh .

CMD ["/app/run.sh"]