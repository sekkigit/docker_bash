#!/bin/bash

SPLIT=$(printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -)

fn_site() { echo;
while true; do
        read -r -p "Do you wish to run WebSite?
Yes | No --> " yn
        case $yn in
            [Yy]* ) echo "Enter domain name you want to use:";
                    read SITE;
                    echo "SITE=$SITE" >> .env;
                    echo "Domain name saved";
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
            [Yy]* ) echo "Enter Time Zone you want to use:";
                    echo "***Countrey/State***";
                    read TIMEZONE;
                    echo "TIMEZONE=$TIMEZONE" >> .env;
                    echo "Time Zone saved";
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
            [Yy]* ) echo "Enter API Key you want to use:";
                    read DNSAPI;
                    echo "DNSAPI=$DNSAPI" >> .env;
                    echo "API Key saved";
                    echo "$SPLIT";
                    fn_bye;;
            [Nn]* ) fn_bye;;
            * ) echo "Please answer yes or no.";;
          esac
done }

fn_bye() { echo "Done with custom variables"; exit 0; }
echo "$SPLIT";

fn_site