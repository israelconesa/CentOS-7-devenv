#!/bin/bash

# download and install intellij IDEA
cd ~

wget http://download.jetbrains.com/idea/ideaIC-13.1.4.tar.gz
tar xvf ideaIC-13.1.4.tar.gz
sudo mv idea-IC-135.1230 /usr/lib
sudo ln -sf /usr/lib/idea-IC-135.1230 /usr/lib/idea


wget -q --no-cookies --no-check-certificate \
"http://www-eu.apache.org/dist/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz"

tar xzvf apache-maven-3.3.9-bin.tar.gz

mv apache-maven-3.3.9  /usr/local/apache-maven

# setup global environment variables
cat > /etc/profile.d/maven.sh <<- "EOF"
#!/bin/bash
MAVEN_HOME=/usr/local/apache-maven/
MAVEN=$MAVEN_HOME/bin
export MAVEN_HOME
export MAVEN
export PATH=$MAVEN:$PATH
EOF

chmod +x /etc/profile.d/maven.sh

source /etc/profile.d/maven.sh

# remove tar
rm -rf apache-maven-3.3.9-bin.tar.gz
