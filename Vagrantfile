# -*- mode: ruby -*-
# vi:set ft=ruby sw=2 ts=2 sts=2:

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/focal64"
  config.vm.box_check_update = false

    config.vm.define "kind-vm" do |node|
      # Name shown in the GUI
      node.vm.provider "virtualbox" do |vb|
          vb.name = "kind-vm"
          vb.memory = 4096
          vb.cpus = 2
      end
      node.vm.hostname = "kind-vm"
      # node.vm.network :private_network, ip: IP_NW + "#{MASTER_IP_START + i}"
      # node.vm.network "forwarded_port", guest: 22, host: "#{2710 + i}"
      node.vm.synced_folder "./src", "/home/vagrant/src"
      
      node.vm.provision "install-docker", type: "shell", :path => "./src/install-docker.sh"
      node.vm.provision "install-kind", type: "shell", :path => "./src/install-kind.sh"
      node.vm.provision "install-kubectl", type: "shell", :path => "./src/install-kubectl.sh"
      node.vm.provision "install-helm", type: "shell", :path => "./src/install-helm.sh"
      node.vm.provision "install-awscli", type: "shell", :path => "./src/install-awscli.sh"
      node.vm.provision "create-cluster", type: "shell", :path => "./src/create-cluster.sh"
      node.vm.provision "install-crossplane", type: "shell", :path => "./src/install-crossplane.sh"
      # node.vm.provision "create-join-k8s-cluster-script", type: "shell", inline: <<-SHELL
      #   JOIN_K8S_CLUSTER_SCRIPT=/home/vagrant/cks/section_1_install_k8s/join_k8s_cluster.sh
      #   kubeadm token create --print-join-command --ttl 0 > ${JOIN_K8S_CLUSTER_SCRIPT}
      #   chmod +x ${JOIN_K8S_CLUSTER_SCRIPT}
      #   kubectl config view --raw > /home/vagrant/cks/local-k8s.kubeconfig
      # SHELL
    end
end 
