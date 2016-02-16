Vagrant.configure(2) do |config|
  config.vm.box = "bento/centos-6.7"
  config.vbguest.auto_update = false
  config.vm.provision "file", source: "~/vagrant/files/git-config", destination: "~/.gitconfig"
  config.vm.hostname = "ec2-clone"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.provision "shell", path: "https://raw.githubusercontent.com/darcyg47/vagrant/master/scripts/aws-ec2-clone.sh"
end