#!/bin/bash

# download and install intellij IDEA
cd ~

wget -q --no-cookies --no-check-certificate \
"http://download-cf.jetbrains.com/idea/ideaIC-2016.2.5.tar.gz"

tar xzvf ideaIC-2016.2.5.tar.gz

mv idea-IC-162.2228.15 /usr/lib
ln -sf /usr/lib/idea-IC-162.2228.15 /usr/lib/idea

# remove tar
rm -rf ideaIC-2016.2.5.tar.gz
