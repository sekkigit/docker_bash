#!/bin/bash

source .env

cat <<EOF > /home/"${SUDO_USER:-$USER}"/docker-compose.yml
version: '3'

services:
  portainer:
    image: portainer/portainer-ce
    container_name: portainer
    security_opt:
      - no-new-privileges:true
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./portainer:/data
    ports:
      - 26501:9000
    restart: unless-stopped
    networks:
      - $DOCNET

  filebrowser:
    image: hurlenko/filebrowser:latest
    container_name: filebrowser
    user: "\${UID}:\${GID}"
    ports:
      - 26502:8080
    volumes:
      - ./:/data
      - ./filebrowser:/config
    environment:
      - FB_BASEURL=/filebrowser
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    networks:
      - $DOCNET

  grafana:
    image: grafana/grafana-oss:latest
    container_name: grafana
    ports:
      - 26503:3000
    volumes:
      - grafana-data:/var/lib/grafana
    restart: unless-stopped
    networks:
      - $DOCNET

  prometheus:
    image: prom/prometheus:latest
    container_name: prometheus
    ports:
      - 26504:9090
    volumes:
      - ./prometheus:/etc/prometheus
      - prometheus-data:/prometheus
    restart: unless-stopped
    command:
      - '--config.file=/etc/prometheus/prometheus.yml'
    networks:
      - $DOCNET

  node_exporter:
    image: quay.io/prometheus/node-exporter:latest
    container_name: node_exporter
    command:
      - '--path.rootfs=/host'
    pid: host
    restart: unless-stopped
    volumes:
      - '/:/host:ro,rslave'
    networks:
      - $DOCNET

  cadvisor:
    image: gcr.io/cadvisor/cadvisor:latest
    container_name: cadvisor
    volumes:
      - /:/rootfs:ro
      - /var/run:/var/run:ro
      - /sys:/sys:ro
      - /var/lib/docker/:/var/lib/docker:ro
      - /dev/disk/:/dev/disk:ro
    devices:
      - /dev/kmsg
    restart: unless-stopped
    networks:
      - $DOCNET

  cloudflare-ddns:
    image: oznu/cloudflare-ddns:latest
    container_name: ddns-cloudflare
    env_file: .env
    environment:
      - API_KEY=\${DNSAPI}
      - ZONE=\${SITE}
      - PUID=\${PUID}
      - PGID=\${PGID}
      - PROXIED=true
    restart: unless-stopped
    networks:
      - $DOCNET

networks:
  $DOCNET:
    external: true

volumes:
  prometheus-data:
    driver: local
  grafana-data:
    driver: local
EOF

docker-compose -f /home/"${SUDO_USER:-$USER}"/docker/docker-compose.yml --env-file /home/"${SUDO_USER:-$USER}"/docker/.env up -d