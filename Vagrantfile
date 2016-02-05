# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure(2) do |config|
  config.vm.define "jenkins-vault" do |jenkins|
    jenkins.vm.box = "bento/centos-6.7"
    jenkins.vm.hostname = "jenkins-vault"
    jenkins.vm.network "forwarded_port", guest: 8080, host: 8080
    jenkins.vm.network "private_network", ip: "192.168.50.1",
      virtualbox__intnet: true
    jenkins.vm.provider "virtualbox" do |vb|
      vb.memory = "2048"
    end

    jenkins.vm.provision "shell", inline: <<-SHELL
      sudo yum install -y java-1.7.0-openjdk git epel-release
      sudo yum install -y ansible
      sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
      sudo rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
      sudo yum install -y jenkins
      sudo chkconfig jenkins on
      sudo service jenkins start
    SHELL

  end

  config.vm.define "stage" do |stage|
    stage.vm.network "private_network", ip: "192.168.50.2",
      virtualbox__intnet: true
    stage.vm.box = "bento/centos-6.7"
    stage.vm.hostname = "stage"
    stage.vm.provider "virtualbox" do |vb|
      vb.memory = "1024"
    end
  end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
  # config.vm.provision "shell", inline: <<-SHELL
  #   sudo apt-get update
  #   sudo apt-get install -y apache2
  # SHELL
end
