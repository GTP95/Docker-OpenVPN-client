FROM alpine:3.13
RUN apk add openvpn
COPY *.ovpn /root
COPY iptables.sh /root
CMD sh iptables.sh
CMD openvpn /root/*.ovpn
