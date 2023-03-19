+++
author = "James Moriarty"
title = "Docker and DLNA"
date = "2022-04-09"
description = ""
categories = ["infrastructure", "networking"]
tags = [
  "docker",
  "dlna",
  "ssdp",
  "macvlan"
]
+++

I've recently discovered the Docker network [macvlan](https://dockerlabs.collabnix.com/intermediate/macvlan.html) driver.

A [macvlan](https://dockerlabs.collabnix.com/intermediate/macvlan.html) driver creates virtual network interfaces, each with its own unique MAC address, that can be configured to communicate with other devices on a network. These virtual interfaces behave like separate physical network interfaces and can be assigned their own IP addresses and network settings.

[Macvlan](https://dockerlabs.collabnix.com/intermediate/macvlan.html) drivers are commonly used in container environments where multiple containers need to be connected to the same physical network interface, but need to appear as separate devices on the network. They can also be used to create virtual network interfaces for virtual machines or to isolate network traffic between different applications running on the same host.

Overall, the [macvlan](https://dockerlabs.collabnix.com/intermediate/macvlan.html) driver provides a flexible and efficient way to manage network interfaces in complex network environments. This characteristic is useful for Digital Living Network Alliance (DLNA) / Simple Service Discovery Protocol (SSDP). These workloads utilize service advertisement and discover via UDP multicast and UHTTP.

## Example

This workload is a port of my Kubernetes to `docker-compose.yml` utilizing the [macvlan](https://dockerlabs.collabnix.com/intermediate/macvlan.html) network driver that previously used `host` driver.

```
version: "3.3"

services:
  minidlna:
    networks:
      lan:
        ipv4_address: "${NETWORK_DLNA_IP}"
    restart: always
    image: "vladgh/minidlna:1.2.0"
    environment:
      - "PUID=${PUID}"
      - "PGID=${PGID}"
      - "MINIDLNA_MEDIA_DIR=/media"
    volumes:
      - "./media:/media:ro"

networks:
  lan:
    driver: macvlan
    driver_opts:
      parent: "${NETWORK_ADAPTER}"
    ipam:
      config:
        - subnet: "${NETWORK_SUBNET}"
```

The corresponding `.env` file.

```
NETWORK_SUBNET=192.168.0.1/24
NETWORK_ADAPTER=eno1
NETWORK_DLNA_IP=192.168.0.212
```

N.B. there is intentionally no route from container from docker host with `macvlan`.
