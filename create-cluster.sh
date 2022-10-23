sudo su
#Download e descompactação do projeto
wget https://github.com/santospv/vagrant-vbox-cluster/archive/refs/heads/main.zip
apt update && sudo apt install unzip -y
unzip main.zip

# criando o volume para rodar a aplicação
cd /var/lib/docker/volumes
mkdir app
cd app/
mkdir _data
cd _data/

#copiando minha aplicação no diretório em que se encontra
cp -r /home/vagrant/vagrant-vbox-cluster-main/site/* .  

#criando o cluster para rodar em 10 replicas de nodes já com volume fixo da applicação
docker service create --name meu-app --replicas 10 -dt -p 80:80 --mount type=volume,src=app,dst=/app/ webdevops/php-apache:alpine-php7

#removendo lixos
rm -rf /home/vagrant/main.zip
rm -rf /home/vagrant/*