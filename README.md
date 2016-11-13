Development environment based on CentOS 7 with KDE

Building the packer box

`cd packer`
`packer build templateGUI.json` or `packer build templateGUIlocal.json` if the
iso is stored locally.

During the build, packer installs CentOS 7 to disk from its iso with a number of
packages, including KDE and other useful packages, see details at
/packer/kickstart/installGUI.cfg.

@base
@core
@development
@fonts
@x11
@internet-browser
@kde-desktop
wget
unzip
git

Additionally, packer further provisions the box with more development software
and cleans the vm before `CentOS_7_KDE.box` file is generated.

Create virtual machine

`vagrant up`

This stands up a new vm in Virtualbox from the packer box following the
instructions on the Vagrantfile.
