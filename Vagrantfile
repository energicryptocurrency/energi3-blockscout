
Vagrant.configure("2") do |config|
    config.vm.define 'web' do |node|
        node.vm.provider "virtualbox" do |v|
            v.memory = 1024
        end
        node.vm.box = "bento/ubuntu-18.04"

        node.vm.network "forwarded_port", guest: 8080, host: 3000, host_ip: "127.0.0.1"
        node.vm.network "forwarded_port", guest: 5432, host: 5432, host_ip: "127.0.0.1"

        node.vm.provision "shell", inline: %Q[
            apt-get update;
            apt-get install -y postgresql-all;
            apt-get install -y python3-pip unzip;
            pip3 install -U futoin-cid;
        ]

        node.vm.provision "shell", path: 'config/devenv_dbconfig.sh'
    end
end
