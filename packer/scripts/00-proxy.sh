#!/bin/bash
# setup proxy

# create proxy profile
touch /etc/profile.d/proxy.sh
chmod +x /etc/profile.d/proxy.sh

# export http proxy (if set)
if [ -n "$PROXY" ]; then
  echo "PROXY"
  echo "$PROXY"
  echo "proxy=${PROXY}" >> /etc/yum.conf
  echo "export HTTP_PROXY=$PROXY" >> /etc/profile.d/proxy.sh
  echo "export http_proxy=$PROXY" >> /etc/profile.d/proxy.sh
  echo "export HTTPS_PROXY=$PROXY" >> /etc/profile.d/proxy.sh
  echo "export https_proxy=$PROXY" >> /etc/profile.d/proxy.sh
fi

# export no proxy (if set)
if [ -n "$NO_PROXY" ]; then
  echo "NO_PROXY"
  echo "$NO_PROXY"
  echo "export NO_PROXY=$NO_PROXY" >> /etc/profile.d/proxy.sh
fi
