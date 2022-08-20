#!/bin/bash

SPLIT=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -)

fn_site() { echo;
while true; do
        read -r -p "Do you wish to run WebSite?
Yes | No --> " yn
        case $yn in
            [Yy]* ) echo;
                    echo "Enter domain name you want to use:";
                    read SITE;
                    echo "SITE=$SITE" >> /home/"${SUDO_USER:-$USER}"/docker/.env;
                    echo;
                    echo "Domain name saved";
                    echo;
                    echo "$SPLIT";
                    fn_tz;;
            [Nn]* ) fn_tz;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_tz() { echo;
while true; do
        read -r -p "Do you wish to set Time Zone?
Yes | No --> " yn
        case $yn in
            [Yy]* ) echo;
                    echo "Enter Time Zone you want to use:";
                    echo "***Countrey/State***";
                    read TIMEZONE;
                    echo "TIMEZONE=$TIMEZONE" >> /home/"${SUDO_USER:-$USER}"/docker/.env;
                    echo;
                    echo "Time Zone saved";
                    echo;
                    echo "$SPLIT";
                    fn_api;;
            [Nn]* ) fn_api;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_api() { echo;
while true; do
        read -r -p "Do you wish to use CloudFlare DNS API?
Yes | No --> " yn
        case $yn in
            [Yy]* ) echo;
                    echo "Enter API Key you want to use:";
                    read DNSAPI;
                    echo "DNSAPI=$DNSAPI" >> /home/"${SUDO_USER:-$USER}"/docker/.env;
                    echo;
                    echo "API Key saved";
                    echo;
                    echo "$SPLIT";
                    fn_bye;;
            [Nn]* ) fn_bye;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_bye() { echo "Done with custom variables"; exit 0; }
echo "$SPLIT";

fn_site