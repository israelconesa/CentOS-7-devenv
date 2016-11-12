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
  # virtualbox provider
  config.vm.provider "virtualbox" do |vb|
    vb.name = "CentOS_7"
	vb.gui = "true"
	vb.customize ["modifyvm", :id, "--ioapic", "on"  ]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
    vb.customize ["modifyvm", :id, "--vram", "32"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end
 end
