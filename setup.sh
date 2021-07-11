#!/bin/sh

mkdir -p ~/goinfre/.minikube
minikube start --vm-driver=virtualbox --cpus=4 --memory=3g

minikube addons enable metallb

eval $(minikube docker-env)
docker pull metallb/speaker:v0.8.2
docker pull metallb/controller:v0.8.2

cd ./srcs
kubectl apply -f loadBalancer/configmap.yaml

cd nginx
docker build -t nginx-image .
kubectl apply -f nginx.yaml
cd ..

cd phpMyAdmin
docker build -t phpmyadmin-image .
kubectl apply -f phpmyadmin.yaml
cd ..

cd mysql
docker build -t mysql-image .
kubectl apply -f  mysql.yaml
cd ..

cd wordpress
docker build -t wordpress-image .
kubectl apply -f  wordpress.yaml
cd ..

cd ftps
docker build -t ftps-image .
kubectl apply -f  ftps.yaml
cd ..

cd influxDB
docker build -t influxdb-image .
kubectl apply -f  influxdb.yaml
cd ..

cd grafana
docker build -t grafana-image .
kubectl apply -f  grafana.yaml
cd ..


