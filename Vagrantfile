$script = <<-SCRIPT                                                            
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo useradd moon
sudo echo "welcome1" |passwd --stdin moon
sudo mkdir /home/moon/.ssh
sudo cp /tmp/authorized_keys /home/moon/.ssh/authorized_keys
sudo chown moon:moon /home/moon/.ssh/authorized_keys
sudo su -
echo -e "moon\tALL=(ALL)\tNOPASSWD: ALL"> /etc/sudoers.d/moon
sudo parted /dev/sdb rm 1
exit
SCRIPT

Vagrant.configure(2) do |config|
        #Basic Configuration
        config.vm.box = "centos/7"
	config.vm.provision "file", source: "~/vagrant-project/zeeid_rsa.pub", destination: "/tmp/authorized_keys"
	config.vm.provision "shell", inline: $script

        (1..4).each do |i|
                vmName = "ansible-client#{i}"
                vmIP = "10.0.0.2#{i}"
                config.vm.define vmName do |server|
                        server.vm.hostname = vmName
                        server.vm.network "public_network", ip: vmIP
			server.persistent_storage.enabled = true
			server.persistent_storage.location = "~/vagrant-project/sourcehdd#{i}.vdi"
			server.persistent_storage.partition = false
			server.persistent_storage.size = 1024
                end
        end
end
