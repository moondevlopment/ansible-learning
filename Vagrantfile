$script = <<-SCRIPT                                                            
sudo sed -i "s/PasswordAuthentication no/PasswordAuthentication yes/" /etc/ssh/sshd_config
sudo systemctl restart sshd
sudo useradd moon
sudo echo "welcome1" |passwd --stdin moon
sudo su -
echo -e "moon\tALL=(ALL)\tNOPASSWD: ALL"> /etc/sudoers.d/moon
exit
SCRIPT

Vagrant.configure(2) do |config|
        #Basic Configuration
        config.vm.box = "centos/7"
	config.vm.provision "shell", inline: $script

        (1..2).each do |i|
                vmName = "ansible-client#{i}"
                vmIP = "10.0.0.2#{i}"
                config.vm.define vmName do |server|
                        server.vm.hostname = vmName
                        server.vm.network "public_network", ip: vmIP
                end
        end
end
