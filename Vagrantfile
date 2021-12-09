# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/ubuntu2004"

  
  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    # Display the VirtualBox GUI when booting the machine
    vb.gui = false
    vb.cpus = 1
    # Customize the amount of memory on the VM:
    vb.memory = "1024"
  end

  config.vm.define "odoo" do |odoo|
    odoo.vm.hostname = "odoo"
    odoo.vm.network :private_network, ip: "192.168.56.10"
    odoo.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbooks/odoo_setup.yml"
    end
  end

  config.vm.define "postgres" do |postgres|
    postgres.vm.hostname = "postgres"
    postgres.vm.network :private_network, ip: "192.168.56.12"
    postgres.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbooks/postgres_setup.yml"
    end
  end
end
