
#Definindo as maquinas e configurações que serão provisionadas utilizando uma imagem do ubuntu-22.04
machines = {
  "master" => {
    "memory"      => "512", 
    "cpu"         => "1", 
    "ip"          => "10",
    "image"       => "bento/ubuntu-22.04"
  },
  "node01" => {
    "memory"      => "512", 
    "cpu"         => "1", 
    "ip"          => "5",
    "image"       => "bento/ubuntu-22.04"
  },
  "node02" => {
    "memory"      => "512", 
    "cpu"         => "1",
    "ip"          => "6", 
    "image"       => "bento/ubuntu-22.04"
  },
  "node03" => {
    "memory"      => "512", 
    "cpu"         => "1",
    "ip"          => "7", 
    "image"       => "bento/ubuntu-22.04"
  }
}

#Configurando o ambiente no Virtual box para provisionamento das maquina do cluster
Vagrant.configure("2") do |config|
  machines.each do |name, conf|
    config.vm.define "#{name}" do |machine|
      machine.vm.box      = "#{conf["image"]}"
      machine.vm.hostname = "#{name}"
      # machine.vm.network "public_network"
      machine.vm.network "private_network", ip: "10.1.1.#{conf["ip"]}"
      machine.vm.provider "virtualbox" do |vb|
        vb.name           = "#{name}"
        vb.memory         = conf["memory"]
        vb.cpus           = conf["cpu"] 
      end
      machine.vm.provision "shell", path: "docker-install.sh"   

      if "#{name}" == "master"
        machine.vm.provision "shell", path: "master.sh"
        machine.vm.provision "shell", path: "create-cluster.sh"
      else
        machine.vm.provision "shell", path: "worker.sh"
      end

    end
  end
end