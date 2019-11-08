# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.ssh.username = "vagrant"
  config.ssh.forward_agent = true
  config.vm.provision :shell, :path => "vagrant_setup.sh", :privileged => true

  name = "warzone"
  memory = "1024"

  config.vm.define "warzone", primary: true do |a64|
    a64.vm.box = "generic/ubuntu1804"
    a64.vm.provider "virtualbox" do |vb, override|
      override.vm.network "private_network", ip: "10.10.10.10"
      override.vm.synced_folder ".", "/vagrant"
      vb.name = name
      vb.memory = memory
      vb.gui = false
    end
    a64.vm.provider "libvirt" do |lv, override|
      override.vm.network "private_network",
        :ip => "10.10.10.10"
      override.vm.synced_folder ".", "/vagrant", :nfs => true
      override.vm.hostname = name
      lv.memory = memory
    end
  end
end
