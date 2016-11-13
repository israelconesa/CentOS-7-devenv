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
  # start from packer box
  config.vm.box = "CentOS_7_KDE.box"
  config.vm.box_url = "file:///home/israelconesa/Development/CentOS-7-box/packer/CentOS_7_KDE.box"
  # set hostname
  config.vm.hostname = "CentOS7.local"
  # virtualbox provider
  config.vm.provider "virtualbox" do |vb|
  vb.name = "CentOS_7_KDE"
	vb.gui = "true"
	vb.customize ["modifyvm", :id, "--ioapic", "on"  ]
    vb.customize ["modifyvm", :id, "--memory", "4096"]
    vb.customize ["modifyvm", :id, "--vram", "16"]
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
  end
  # virtualbox provision with dev packages
  config.vm.provision "shell", path: "packer/scripts/03-docker.sh"
  config.vm.provision "shell", path: "packer/scripts/04-java.sh"
  config.vm.provision "shell", path: "packer/scripts/05-maven.sh"
  #config.vm.provison "shell", path: "packer/scripts/06-intellij.sh" ???
end
