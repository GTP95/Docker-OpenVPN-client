FROM alpine:latest
RUN apk add openvpn
COPY *.ovpn /root
CMD openvpn /root/*.ovpn

