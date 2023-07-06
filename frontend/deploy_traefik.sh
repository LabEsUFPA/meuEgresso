#!/bin/bash

docker pull alverad/meu-egresso-front:latest && docker stack deploy -c <(docker-compose -f docker-compose.yml config) meuegresso-front