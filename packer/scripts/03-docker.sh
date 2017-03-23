#!/bin/bash

# install docker
curl -fsSL https://get.docker.com/ | sh

# Start service
systemctl start docker

# flush changes to service
systemctl daemon-reload

<<<<<<< Updated upstream:packer/scripts/03-docker.sh
# add user to docker group
=======
# create docker group and add user
# groupadd docker
>>>>>>> Stashed changes:packer/scripts/02-docker.sh
usermod -aG docker vagrant

# Ensure docker service always starts
systemctl enable docker

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
