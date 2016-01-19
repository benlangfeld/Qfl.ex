# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", "768"]
  end
  config.vm.synced_folder ".", "/vagrant"

  config.vm.define :package_test do |package_test|
    package_test.vm.network :forwarded_port, guest: 6000, host: 6000

    package_test.vm.provision "shell", inline: <<-SCRIPT
      wget -qO - https://deb.packager.io/key | sudo apt-key add -
      echo "deb https://deb.packager.io/gh/benlangfeld/QueueFlex trusty master" | sudo tee /etc/apt/sources.list.d/QueueFlex.list
      sudo apt-get -y update
      sudo apt-get -y install queueflex
      sudo queueflex scale web=1
    SCRIPT
  end
end
