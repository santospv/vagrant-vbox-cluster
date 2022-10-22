#!/bin/bash
sudo docker swarm init --advertise-addr=10.1.1.10
sudo docker swarm join-token worker | grep docker > /vagrant/worker.sh