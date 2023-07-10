#!/bin/bash

[ ! -d "./meuEgressoFotos" ] && echo "Diretorio 'meuEgressoFotos' não existe, logo não é possivel armazenar as fotos dos egressos." && exit 1;

[ ! -f "./.env" ] && echo "Arquivo de configuração '.env' não existe, consulte o manual" && exit 1;

[ -d "./meuEgressoFotos" ] && docker pull alverad/meu-egresso-api:latest && docker stack deploy -c <(docker-compose -f docker-compose.api.yml config) meuegresso-api