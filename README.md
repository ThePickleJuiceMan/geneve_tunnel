# Geneve Tunnel with Debian Containers
Build and run a simple GEneric NEtwork Virtualization Encapsulation tunnel on debian containers.

# # # Requirements
Docker

# # # Description
Builds from base Debian container image. Installs ip tools and creates a geneve tunnel between the two containers. A simple overlay network (point to point) is established to show IP reachability across the underlay tunnel endpoints.