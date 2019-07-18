
Vagrant.configure("2") do |config|
    config.vm.define 'web' do |node|
        node.vm.provider "virtualbox" do |v|
            v.memory = 1024
        end
        node.vm.box = "bento/ubuntu-18.04"

        node.vm.network "forwarded_port", guest: 8080, host: 3000, host_ip: "127.0.0.1"

        node.vm.provision "shell", inline: %Q[
            apt-get update;
            apt-get install -y postgresql-all;
            apt-get install -y python3-pip unzip;
            pip3 install -U futoin-cid;
            sudo -u postgres psql -c "CREATE USER vagrant WITH PASSWORD 'vagrant';"
            sudo -u postgres psql -c "CREATE DATABASE vagrant WITH OWNER=vagrant
                LC_COLLATE='en_US.utf8' LC_CTYPE='en_US.utf8'
                ENCODING='UTF8' TEMPLATE=template0;"
        ]
    end
end
