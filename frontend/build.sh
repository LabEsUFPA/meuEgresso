#!/bin/bash

[ ! -d "./.env" ] && echo "Arquivo de configuração '.env' não existe, consulte o manual" && exit 1;

docker build . --file docker/Dockerfile --tag meu-egresso-front-local:latest &&

docker stack deploy -c <(docker-compose -f docker-compose.local.yml config) meuegresso-front
