#!/bin/bash
# install docker

curl -fsSL https://get.docker.com/ | sh

#cat > /etc/sysconfig/docker <<- "EOF"
#other_args="--insecure-registry 10.20.2.139:5000"
#EOF

#sed -i 's/other_args=/other_args="--insecure-registry 10.20.2.139:5000"/' /etc/sysconfig/docker

# Start service
systemctl start docker

# configure systemd
mkdir /etc/systemd/system/docker.service.d
touch /etc/systemd/system/docker.service.d/proxy.conf

cat > /etc/systemd/system/docker.service.d/proxy.conf <<- "EOF"
[Service]
Environment="HTTP_PROXY=http://10.9.1.80:8080/" "HTTPS_PROXY=http://10.9.1.80:8080/" "NO_PROXY=localhost,127.0.0.1,*.cyberreveal.local"
EOF

# flush changes to service
systemctl daemon-reload

# create docker group and add user
groupadd docker
usermod -aG docker vagrant

# Ensure docker service always starts
#service docker start
#chkconfig docker on
systemctl enable docker

# install docker-compose
curl -L https://github.com/docker/compose/releases/download/1.8.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
