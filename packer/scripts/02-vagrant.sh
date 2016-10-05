#!/bin/bash
# set up vagrant ssh

# create ssh directory
mkdir /home/vagrant/.ssh
chmod 0700 /home/vagrant/.ssh

# download authorized keys
wget --no-check-certificate \
  https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub \
  -O /home/vagrant/.ssh/authorized_keys
chmod 0600 /home/vagrant/.ssh/authorized_keys

# ensure vagrant owns ssh directory
chown -R vagrant /home/vagrant/.ssh

# ensure vagrant starts in /vagrant directory
touch /home/vagrant/.bashrc
echo "[ -d /vagrant ] && cd /vagrant" >> /home/vagrant/.bashrc

# ensure vagrant owns home directory
chown -R vagrant /home/vagrant
chmod -R 0700 /home/vagrant
