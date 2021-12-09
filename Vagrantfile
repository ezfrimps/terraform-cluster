# -*- mode: ruby -*-
# vi: set ft=ruby :
$script = <<-SCRIPT
echo '192.168.56.12 postgres ' >> /etc/hosts
SCRIPT

Vagrant.configure("2") do |config|
  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "generic/ubuntu2004"

  config.vm.synced_folder ".", "/vagrant"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    vb.cpus = 1
    vb.memory = "1024"
  end

  config.vm.define "postgres" do |postgres|
    postgres.vm.hostname = "postgres"
    postgres.vm.network :private_network, ip: "192.168.56.12"
    postgres.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbooks/postgres_setup.yml"
    end
    # postgres.vm.provision "shell", inline: $script
  end
  
  config.vm.define "odoo" do |odoo|
    odoo.vm.hostname = "odoo"
    odoo.vm.network :public_network, bridge: "wlp1s0"
    odoo.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "playbooks/odoo_setup.yml"
    end
    odoo.vm.provision "shell", inline: $script
  end
end
