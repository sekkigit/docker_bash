#!/bin/bash

SPLIT=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -)
apt update
clear

fn_start() { echo;
while true; do
        read -r -p "Do you wish to run this scrict for Docker setup?
Yes | No --> " yn
        case $yn in
            [Yy]* ) echo;
                    echo "Let's start the setup.";
                    echo "$SPLIT";
                    fn_install;;
            [Nn]* ) fn_bye;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_install() { echo;
while true; do
        read -r -p "Do you wish to install Docker and Docker-compose?
Yes | No --> " yn
        case $yn in
            [Yy]* ) bash ./bash/docker_install.sh &> /dev/null;
                    echo;
                    echo "Docker is $(systemctl is-enabled docker) and $(systemctl is-active docker). Docker system prune automated.";
                    echo "$SPLIT";
                    fn_env;;
            [Nn]* ) fn_env;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_env() { echo;
while true; do
        read -r -p "Do you wish to create Variables for docker-comose file?
Yes | No --> " yn
        case $yn in
            [Yy]* ) bash ./bash/set_vars.sh;
                    echo;
                    echo "Created docker .env";
                    echo "$SPLIT";
                    fn_network;;
            [Nn]* ) fn_network;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_network() { echo;
while true; do
        read -r -p "Do you wish to create network for docker-comose?
Yes | No --> " yn
        case $yn in
            [Yy]* ) echo "Enter network name you want to use:";
                    read DOCNET;
                    docker network create "$DOCNET";
                    echo "DOCNET=$DOCNET" >> /home/"${SUDO_USER:-$USER}"/docker/.env;
                    echo "DOCNET=$DOCNET" >> /home/"${SUDO_USER:-$USER}"/docker/.var;
                    echo;
                    echo "Created docker network";
                    echo "$SPLIT";
                    fn_compose;;
            [Nn]* ) fn_compose;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_compose() { echo;
while true; do
        echo "Do you wish to run Portainer, Grafana, filebrowser and cloudflare-ddns?"
        read -r -p "Create docker-comose.yml file?
Yes | No --> " yn
        case $yn in
            [Yy]* ) bash ./bash/prometheus.sh &> /dev/null;
                    bash cp ./json/* /home/"${SUDO_USER:-$USER}"/docker/grafana/dashboards/ &> /dev/null;
                    bash ./bash/docker_compose.sh
                    echo "$SPLIT";
                    echo "Created docker-comose.yml with:";
                    echo ;
                    echo "Portainer........(deploy, configure and secure your container environments)";
                    echo "Grafana..........(analytics & monitoring solution)";
                    echo "Prometheuse......(monitoring system with a dimensional data model)";
                    echo "cAdvisor.........(performance characteristics of the running containers)";
                    echo "node_exporter....(monitor the host system)";
                    echo "filebrowser......(file managing interface within a specified directory)";
                    echo "cloudflare-ddns..(update dynamic DNS entries for accounts on various DNS providers)";
                    echo "";
                    rm /home/"${SUDO_USER:-$USER}"/docker/.var
                    echo "$SPLIT";
                    fn_bye;;
            [Nn]* ) fn_bye;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_bye() {
     echo;
     echo "Exiting setup";
     exit 0; 
}

fn_start