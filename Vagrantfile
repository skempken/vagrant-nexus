# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "precise32"
  config.vm.box_url = "http://files.vagrantup.com/precise32.box"

  config.vm.network :forwarded_port, guest: 8081, host: 9000

  # Optional. Allows to sync Nexus work folder to the host machine.
  config.vm.synced_folder "./nexus", "/srv/sonatype-work/nexus", create: true, :mount_options => ["uid=998,gid=998"]

  config.vm.provision :puppet do |puppet|
     puppet.manifests_path = "puppet/manifests"
     puppet.module_path = "puppet/modules"
   end
	
  config.vm.provision "shell", inline: "service nexus restart", run: "always"
end
