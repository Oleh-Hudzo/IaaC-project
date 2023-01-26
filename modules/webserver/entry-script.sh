#!/bin/bash
sudo yum update -y && sudo yum install -y docker
sudo systemctl start docker
sudo chmod 666 /var/run/docker.sock
docker run -p 8080:80 nginx
