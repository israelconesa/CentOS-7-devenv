# -*- mode: ruby -*-
# vi: set ft=ruby :

# check guest additions plugin is installed
unless Vagrant.has_plugin?("vagrant-vbguest")
  puts
  warn "OOPS! vbguest plugin is not installed"
  puts
  warn "Run the following to install:"
  abort "vagrant plugin install vagrant-vbguest"
end

# check internet proxy plugin is installed
unless Vagrant.has_plugin?("vagrant-proxyconf")
  puts
  warn "OOPS! proxyconf plugin is not installed"
  puts
  warn "Run the following to install:"
  abort "vagrant plugin install vagrant-proxyconf"
end

# check dev has http proxy environment variable
unless ENV['HTTP_PROXY'] && ENV['HTTP_PROXY'] != ""
  puts
  warn "OOPS! you're missing HTTP_PROXY environment variable"
  puts
  warn "For Guildford:"
  warn "export HTTP_PROXY=http://10.9.1.80:8080/"
  warn "For Leeds:"
  warn "export HTTP_PROXY=http://172.17.7.1:8080/"
  warn "For KL:"
  warn "export HTTP_PROXY=http://10.129.49.21:8080/"
  abort
end

# check dev has https proxy environment variable
unless ENV['HTTPS_PROXY'] && ENV['HTTPS_PROXY'] != ""
  puts
  warn "OOPS! you're missing HTTPS_PROXY environment variable"
  puts
  warn "For Guildford:"
  warn "export HTTPS_PROXY=http://10.9.1.80:8080/"
  warn "For Leeds:"
  warn "export HTTPS_PROXY=http://172.17.7.1:8080/"
  warn "For KL:"
  warn "export HTTPS_PROXY=http://10.129.49.21:8080/"
  abort
end

# check dev has no proxy environment variable
unless ENV['NO_PROXY'] && ENV['NO_PROXY']!=''
  puts
  warn "OOPS! you're missing NO_PROXY environment variable"
  puts
  warn "export NO_PROXY=localhost,127.0.0.1,10.20.2.139"
  abort
end

# virtual machine
Vagrant.configure("2") do |config|
  # start from centos
  config.vm.box = "CentOS_7.box"
  #config.vm.box_version = "1.0.0"
  config.vm.box_url = "file://C:/devtools/code/CentOS-7-baseline/packer/CentOS_7.json"
  # set hostname
  config.vm.hostname = "CentOS7.local"
  # proxy config
  config.proxy.no_proxy = ENV['NO_PROXY']
  config.proxy.no_proxy = ENV['HTTP_PROXY']
  config.proxy.no_proxy = ENV['HTTPS_PROXY']
  # virtualbox provider
  config.vm.provider "virtualbox" do |vb|
    vb.name = "CentOS_7"
	vb.gui = "true"
	vb.customize ["modifyvm", :id, "--ioapic", "on"  ]
    vb.customize ["modifyvm", :id, "--memory", "16384"]
    vb.customize ["modifyvm", :id, "--vram", "32"]
    vb.customize ["modifyvm", :id, "--cpus", "4"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--draganddrop", "bidirectional"]
  end
 end
