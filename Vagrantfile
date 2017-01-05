# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu/trusty64"
	config.vm.hostname = "dynamodb-local"

  config.vm.provider "virtualbox" do |v|
    # On VirtualBox, we don't have guest additions or a functional vboxsf
    # in TinyCore Linux, so tell Vagrant that so it can be smarter.
    v.check_guest_additions = false
    #v.functional_vboxsf     = false
    v.name = "dynamodb-local"
  end  

  ## Port forwarding - DynamoDB
	config.vm.network :forwarded_port, guest: 8000, host: 8000

  ## Provisioning script - DynamoDB
  config.vm.provision "docker" do |d|
    d.build_image "/vagrant",
      args: " -t dynamolocal"
    d.run "dynamolocal",
      args: " -p 8000:8000"
  end

end