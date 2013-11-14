Vagrant.configure("2") do |config|
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest

  config.vm.provider :virtualbox do |vb|
    vb.customize [
      "modifyvm", :id,
      "--memory", "1024",
      "--cpus", "2",
    ]
  end

  config.vm.box = "precise-server-cloudimg-amd64-vagrant-disk1"
  config.vm.box_url = "http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box"
  config.vm.hostname = "vagrant-windows-devenv"

  config.vm.synced_folder "../vagrant-windows", "/vagrant-windows"

  config.vm.provision :chef_solo do |chef|
    chef.run_list = [
      "recipe[vagrant-windows-devenv]"
    ]
  end
end