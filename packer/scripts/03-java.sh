#!/bin/bash

# download and install java runtime
cd ~

wget -q --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" \
"http://download.oracle.com/otn-pub/java/jdk/8u101-b13/jdk-8u101-linux-x64.rpm"

yum -y localinstall jdk-8u101-linux-x64.rpm

# setup global environment variables
cat > /etc/profile.d/java.sh <<- "EOF"
#!/bin/bash
JAVA_HOME=/usr/java/jdk1.8.0_101/
PATH=$PATH:$JAVA_HOME
export PATH JAVA_HOME
export CLASSPATH=.
EOF

chmod +x /etc/profile.d/java.sh

source /etc/profile.d/java.sh

# remove rpm
rm -rf jdk-8u101-linux-x64.rpm