# Docker image to run a OpenVPN client

## Steps to build and run:

1. Place your certificate inside this directory
2. Reserve an IP address on your local network for the container, it will be referred later as $ADDRESS
3. Build a Docker network for the container. Substitute $INTERFACE with the name of the physical interface used by the host to connect to your LAN, $SUBNET with your LAN's subnet (e.g. 192.168.1.0/24) and $GATEWAY with your LAN's gateway IP address (e.g. 192.168.1.1).
```BASH
docker network create -d macvlan -o parent=$INTERFACE \
  --subnet $SUBNET \
  --gateway $GATEWAY \
  openvpn_network

```
4. Build the image:

```BASH
docker build -t openvpn_client .
```

5. Start the container with the required permissions and a static IP address:

```BASH
docker run --cap-add=NET_ADMIN --device /dev/net/tun --net openvpn_network --ip $ADDRESS openvpn_client
```

6. Configure your devices to use $ADDRESS as their default gateway
